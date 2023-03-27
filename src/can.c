//=============================INCLUDES
#include "peripheral/mcan/plib_mcan0.h"
#include "peripheral/mcan/plib_mcan_common.h"

#include <xc.h>
#include <stdbool.h>
#include "user.h"
#include "can.h"
#include "timer.h"
#include "inverter.h"
#include "precharge.h"
#include "pio.h"
#include "car_control.h"
//==============================DEFINITIONS

//CAN receive Ids
#define CAN_ID_PEDAL_BOARD	0x100
#define CAN_ID_BMS_CELL_BROADCAST 0x6B0 
#define CAN_ID_RELAY_STATE 0x009
#define CAN_ID_AUX_STATES		0x900
#define CAN_ID_RTD          0x469
#define CAN_ID_IGNITION     0x500
#define CAN_ID_BMS_DLC		0x6B1
#define CAN_ID_STEERING_SENSOR  0x101

//CAN send Ids
#define CAN_ID_TX_TO_BMS    0x008
#define CAN_ID_TX_TO_LOGGER_1   0x7A1
#define CAN_ID_TX_TO_LOGGER_2   0x7A2
#define CAN_ID_TX_TO_LOGGER_3   0x7A3

#define CAN_RX_BUFFER_SIZE 16

//=============================GLOBAL VAR

//============================LOCAL VAR

uint8_t Mcan0MessageRAM[MCAN0_MESSAGE_RAM_CONFIG_SIZE] __attribute__((aligned (32)))__attribute__((space(data), section (".ram_nocache")));

MCAN_RX_BUFFER can_rx_queue[CAN_RX_BUFFER_SIZE];
uint8_t can_rx_queue_head = 0;
uint8_t can_rx_queue_tail = 0;
uint8_t can_rx_queue_len = 0;




//===================================LOCAL FUNC DECLARATIONS

MCAN_RX_BUFFER* can_rx_queue_pop(void);
MCAN_RX_BUFFER* can_rx_queue_push(void);
void can_rx_queue_initialise(void);

void can_rx_callback(uint8_t numberOfMessage, uintptr_t contextHandle);

void send_can_message(uint16_t id, uint8_t data[],int length);
//===========================================GLOBAL FUNC

void handle_can(void)
{		
    //If there are received CAN messages to handle
	if(can_rx_queue_len > 0)
	{
		MCAN_RX_BUFFER *buf;
		buf = can_rx_queue_pop();
		//Take pedal board

		switch(buf->id)
		{
			case CAN_ID_PEDAL_BOARD:
                comms_time.pb = current_time_ms();
                if(buf->data[0]&1)
				{
					car_control.user_pedal_value = buf->data[1];
                    //SYS_CONSOLE_PRINT("%d",car_control.user_pedal_value);
                }
                else{
                    car_control.user_pedal_value = 0;
                }
				break;
            
            case CAN_ID_STEERING_SENSOR:
                car_control.user_steering_value = buf->data[0]*256 + buf->data[1];
                //SYS_CONSOLE_PRINT("Steering value: %d\n\r",car_control.user_steering_value);
                break;
            
            case CAN_ID_RELAY_STATE:
                comms_time.bms = current_time_ms();
                //SYS_CONSOLE_PRINT("BMS STATE: %d\n\r",buf->data[0]);
                if(buf->data[0] >> 7 == 0){
                    bms.ams_precharge_enabled = true;
                }
                else{
                    bms.ams_precharge_enabled = false;
                }
                break;

			case CAN_ID_BMS_CELL_BROADCAST:
                comms_time.bms = current_time_ms();
                bms.voltage = (((uint16_t)buf->data[2] << 8) + buf->data[3])/10.0f;
                bms.current = (buf->data[0]*256 + buf->data[1])/10.0f;
				break;
				
			case CAN_ID_RTD:
				comms_time.dash = current_time_ms();
                bool rtd_switch_state = (!!buf->data[0]);
                if(car_control.precharge_ready){
                    if(car_control.rtd_startup_flag){ //checks whether the switch has been turned from off to on since startup
                        car_control.ready_to_drive = rtd_switch_state;
                    }
                    else{
                        if(rtd_switch_state == false) car_control.rtd_startup_flag = true;
                        else car_control.rtd_startup_flag = false;
                    }
                }
                else if(car_control.rtd_startup_flag) car_control.rtd_startup_flag = false; //reset condition for startup flag
				break;
            
            case CAN_ID_IGNITION:
                comms_time.dash = current_time_ms();
                car_control.ignition = buf->data[0];
                break;
                
				
			case CAN_ID_BMS_DLC:
				
				bms.pack_dlc = 0;
				bms.pack_dlc = (uint16_t)buf->data[0] << 8;
				bms.pack_dlc += buf->data[1];
				
				break;

			//case CAN_ID_AUX_STATES:
				//comms_time.bms = current_time_ms();
               // break;
		}
		
		
	}
    
    //Handle transmitting CAN messages
    if(tx_ready.bms)
	{
        tx_time.bms = current_time_ms();
        
        uint8_t precharge_data_to_send[1] = {0};
    
        if(bms.precharge_enable) precharge_data_to_send[0] = 1;
        
        send_can_message(CAN_ID_TX_TO_BMS,precharge_data_to_send,1);
        
    }
    
    if(tx_ready.logger)
	{
        tx_time.logger = current_time_ms();
        
        uint16_t inv1_current_inflated = inv1.phase_current*10;
        uint16_t inv1_voltage_inflated = inv1.voltage*10;
        uint16_t inv1_pwm_deflated = inv1.pwm/2;
        uint8_t inv1_data[] = 
            {inv1.motor_temp*2+inv1_pwm_deflated/256, inv1_pwm_deflated%256,
            inv1_current_inflated/256, inv1_current_inflated%256,
            inv1_voltage_inflated/256, inv1_voltage_inflated%256,
            inv1.rpm/256, inv1.rpm%256};
        send_can_message(CAN_ID_TX_TO_LOGGER_1,inv1_data,8);
        
        uint16_t inv2_current_inflated = inv2.phase_current*10;
        uint16_t inv2_voltage_inflated = inv2.voltage*10;
        uint16_t inv2_pwm_deflated = inv2.pwm/2;
        uint8_t inv2_data[] = 
            {inv2.motor_temp*2+inv2_pwm_deflated/256, inv2_pwm_deflated%256,
            inv2_current_inflated/256, inv2_current_inflated%256,
            inv2_voltage_inflated/256, inv2_voltage_inflated%256,
            inv2.rpm/256, inv2.rpm%256};
        send_can_message(CAN_ID_TX_TO_LOGGER_2,inv2_data,8);
        
        uint8_t brake_pres_data[sizeof(float)];
        memcpy(brake_pres_data,&car_control.brake_pressure,sizeof(float));
        send_can_message(CAN_ID_TX_TO_LOGGER_3,brake_pres_data,sizeof(float));
    }
}

void init_can(void)
{
	
	
	MCAN0_Initialize();
	MCAN0_MessageRAMConfigSet(Mcan0MessageRAM);
	MCAN0_RxFifoCallbackRegister(MCAN_RX_FIFO_0, can_rx_callback, (uintptr_t)(NULL));
}

//=====================================LOCAL FUNC
void can_rx_callback(uint8_t numberOfMessage, uintptr_t contextHandle)
{
	MCAN_RX_BUFFER* can_temp;
	can_temp = can_rx_queue_push();
	
	MCAN0_MessageReceiveFifo(MCAN_RX_FIFO_0, numberOfMessage, can_temp);	
}


//returns a pointer to where the next can message can be stored
MCAN_RX_BUFFER* can_rx_queue_push(void)
{
	MCAN_RX_BUFFER* ret = &can_rx_queue[can_rx_queue_head];
	
	if(can_rx_queue_head + 1< CAN_RX_BUFFER_SIZE) can_rx_queue_head++;
	else can_rx_queue_head = 0;
	
	if(can_rx_queue_len < CAN_RX_BUFFER_SIZE) can_rx_queue_len++;
	
	return ret;
}

//returns a pointer to the can message at the bottom of the queue
MCAN_RX_BUFFER* can_rx_queue_pop(void)
{
	MCAN_RX_BUFFER* ret = &can_rx_queue[can_rx_queue_tail];
	
	if(can_rx_queue_tail + 1 < CAN_RX_BUFFER_SIZE) can_rx_queue_tail++;
	else can_rx_queue_tail = 0;
	
	if(can_rx_queue_len > 0) can_rx_queue_len--;
	else
	{
		//&&Need a return case for if the length is 0
	}	
	return ret;
}

//helper function that sends a CAN message given an ID and a byte array of data
//it will always send 8 bytes regardless of the length of the data passed to it
//it fills any remaining bytes with 0s
void send_can_message(uint16_t id, uint8_t data[],int length){
    
    MCAN_TX_BUFFER temp_tx_buf = {
        .data = {0,0,0,0,0,0,0,0},
        .dlc = length,
        .id = id,
        .sof = 1
    };
    
    for(int i = 0; i < length && i < 8; i++)
	{
        temp_tx_buf.data[i] = data[i];
	}
		
    MCAN0_MessageTransmitFifo(1,&temp_tx_buf);
}
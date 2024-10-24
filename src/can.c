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
#include "globals.h"
#include "can_inverters.h"
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
#define CAN_ID_SBG_IMU_DELTA_ANGLE 0x124
#define CAN_ID_SBG_IMU_DELTA_VEL    0x123
#define CAN_ID_SBG_EKF_VEL_BODY 0x139
#define CAN_ID_SBG_EKF_VEL_NED_ACC  0x138

#define CAN_ID_INV1_HS1		((PGN_HS1 << 8) + (0xFF << 8) + INV_RIGHT_ADDRESS)
#define CAN_ID_INV1_HS2		((PGN_HS2 << 8) + (0xFF << 8) + INV_RIGHT_ADDRESS)
#define CAN_ID_INV1_HS3		((PGN_HS3 << 8) + (0xFF << 8) + INV_RIGHT_ADDRESS)
#define CAN_ID_INV1_HS4		((PGN_HS4 << 8) + (0xFF << 8) + INV_RIGHT_ADDRESS)

#define CAN_ID_INV2_HS1		((PGN_HS1 << 8) + (0xFF << 8) + INV_LEFT_ADDRESS)
#define CAN_ID_INV2_HS2		((PGN_HS2 << 8) + (0xFF << 8) + INV_LEFT_ADDRESS)
#define CAN_ID_INV2_HS3		((PGN_HS3 << 8) + (0xFF << 8) + INV_LEFT_ADDRESS)
#define CAN_ID_INV2_HS4		((PGN_HS4 << 8) + (0xFF << 8) + INV_LEFT_ADDRESS)


//CAN send Ids
#define CAN_ID_TX_TO_BMS    0x008
#define CAN_ID_TX_TO_LOGGER_1   0x7A1
#define CAN_ID_TX_TO_LOGGER_2   0x7A2
#define CAN_ID_TX_TO_LOGGER_3   0x7A3
#define CAN_ID_TX_STATUS        0x7A4
#define CAN_ID_TX_STARTUP_PARAMS    0x7A5

#define CAN_RX_BUFFER_SIZE 64

//=============================GLOBAL VAR

//============================LOCAL VAR

uint8_t Mcan0MessageRAM[MCAN0_MESSAGE_RAM_CONFIG_SIZE] __attribute__((aligned (32)))__attribute__((space(data), section (".ram_nocache")));

MCAN_RX_BUFFER can_rx_queue[CAN_RX_BUFFER_SIZE];
uint8_t can_rx_queue_head = 0;
uint8_t can_rx_queue_tail = 0;
uint8_t can_rx_queue_len = 0;


static volatile bool rtd_startup_flag = false;

union {
    int16_t i;
    uint8_t bytes[2];
} int16_bytes_converter;

//===================================LOCAL FUNC DECLARATIONS

MCAN_RX_BUFFER* can_rx_queue_pop(void);
MCAN_RX_BUFFER* can_rx_queue_push(void);

void can_rx_callback(uint8_t numberOfMessage, uintptr_t contextHandle);

//===========================================GLOBAL FUNC

void handle_can(void)
{		
	
#ifdef DEBUG_IGNORE_IGNITION
	car_control.ignition = true;
#endif
	
    //If there are received CAN messages to handle
	if(can_rx_queue_len > 0)
	{
		MCAN_RX_BUFFER *buf;
		buf = can_rx_queue_pop();
		//Take pedal board

		//first check for the J1939 ids
		uint32_t temp_id = buf->id;
		temp_id &= 0x01FFFFFF;
		
		switch(temp_id)
		{
			case CAN_ID_INV1_HS1:
				parse_HS1(&inv1, buf->data);
				comms_time.inv1 = current_time_ms();
				break;
			case CAN_ID_INV1_HS2:
				parse_HS2(&inv1, buf->data);
				comms_time.inv1 = current_time_ms();
				break;
			case CAN_ID_INV1_HS3:
				parse_HS3(&inv1, buf->data);
				comms_time.inv1 = current_time_ms();
				break;
			case CAN_ID_INV2_HS1:
				parse_HS1(&inv2, buf->data);
				comms_time.inv2 = current_time_ms();
				break;
			case CAN_ID_INV2_HS2:
				parse_HS2(&inv2, buf->data);
				comms_time.inv2 = current_time_ms();
				break;
			case CAN_ID_INV2_HS3:
				parse_HS3(&inv2, buf->data);
				comms_time.inv2 = current_time_ms();
				break;
			default:
				
				temp_id = 0x7FF & (buf->id >> 18);				
				
				switch(temp_id)
				{
					case CAN_ID_PEDAL_BOARD:

						if(buf->data[0]&1)
						{
							car_control.user_pedal_value = buf->data[1];
							comms_time.pb = current_time_ms();
							//SYS_CONSOLE_PRINT("%d\n\r",car_control.user_pedal_value);
						}
						break;

					case CAN_ID_STEERING_SENSOR:
						comms_time.steering = current_time_ms();
						float measurement = (buf->data[0]*256 + buf->data[1] - 440)/390.0f;
						car_control.user_steering_value = 0.18f*measurement + car_control.user_steering_value*0.82f;
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
						bms.voltage = (((uint16_t)buf->data[2] << 8) + buf->data[3])/10.0f;
						bms.current = (buf->data[0]*256 + buf->data[1])/10.0f;
						break;

					case CAN_ID_RTD:
						comms_time.dash = current_time_ms();
						bool rtd_switch_state = (!!buf->data[0]);

						/*
						 * Wtf does rtd_startup_flag do?...
						 */
						if(car_control.precharge_ready && car_control.inverter_params_complete)	//If the invereters + battery is ready to go
						{
							if(rtd_startup_flag)			//If startup conditions are good, then continue
							{ 
								if(rtd_switch_state == true && car_control.brake_on && car_control.user_pedal_value == 0)	//If the switch is on, the brakes are on, and there is no pedal demand, then we are ready
								{
									car_control.ready_to_drive = true;
								}
								else if(rtd_switch_state == false) 
								{
									car_control.ready_to_drive = false;
									rtd_startup_flag = car_control.brake_on && car_control.user_pedal_value == 0;
								}
							}
							else{
								if(rtd_switch_state == false && car_control.brake_on && car_control.user_pedal_value == 0)
								{	
									rtd_startup_flag = true;
								}
										
								//else rtd_startup_flag = false;
							}
						}
						else	//If the battery is not ready then make sure we aren't ready to drive, and the startup flag is false
						{
							rtd_startup_flag = false;
							car_control.ready_to_drive = false;
						}
						break;

					case CAN_ID_IGNITION:
						comms_time.dash = current_time_ms();
		#ifndef DEBUG_IGNORE_IGNITION
						car_control.ignition = buf->data[0];
		#endif
						break;


					case CAN_ID_BMS_DLC:

						bms.pack_dlc = 0;
						bms.pack_dlc = (uint16_t)buf->data[0] << 8;
						bms.pack_dlc += buf->data[1];

						break;

					//case CAN_ID_AUX_STATES:
						//comms_time.bms = current_time_ms();
					   // break;

					case CAN_ID_SBG_IMU_DELTA_ANGLE:
						int16_bytes_converter.bytes[0] = buf->data[4];
						int16_bytes_converter.bytes[1] = buf->data[5];
						car_control.yaw_rate = (int16_bytes_converter.i)*0.0001f+0.9f*car_control.yaw_rate;
						break;

					case CAN_ID_SBG_IMU_DELTA_VEL:
						int16_bytes_converter.bytes[0] = buf->data[0];
						int16_bytes_converter.bytes[1] = buf->data[1];
						car_control.a_x = (int16_bytes_converter.i)*0.01f;
						break;

					case CAN_ID_SBG_EKF_VEL_BODY:
						int16_bytes_converter.bytes[0] = buf->data[0];
						int16_bytes_converter.bytes[1] = buf->data[1];
						car_control.v_x = (int16_bytes_converter.i)*0.01f;
						break;

					case CAN_ID_SBG_EKF_VEL_NED_ACC:
						int16_bytes_converter.bytes[0] = buf->data[0];
						int16_bytes_converter.bytes[1] = buf->data[1];
						float v_n_acc = int16_bytes_converter.i*0.01f;
						int16_bytes_converter.bytes[0] = buf->data[2];
						int16_bytes_converter.bytes[1] = buf->data[3];
						float v_e_acc = int16_bytes_converter.i*0.01f;
						car_control.v_acc = (v_n_acc+v_e_acc)/2;
						break;
					case 0x38:
						break;
					case 0x6D0:
						break;
				}						
				
				break;
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
    
    
    if(tx_ready.status){
		
		tx_time.status = current_time_ms();
		
        uint8_t status_data[] =
            {
            ass.break_loop_inverter_error,
            ass.break_loop_precharge,
            ass.break_loop_timeout,
            ass.break_loop_ts_deactive,
            car_control.ins_error_code,
            0,
            0,
            (comms_active_snapshot.bms<<5)
                    +(comms_active_snapshot.dash<<4)+(comms_active_snapshot.inv1<<3)
                    +(comms_active_snapshot.inv2<<2)+(comms_active_snapshot.pb<<1)
                    +comms_active_snapshot.steering};
        send_can_message(CAN_ID_TX_STATUS,status_data,8);
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
void send_can_message(uint32_t id, uint8_t data[],int length){
    
    MCAN_TX_BUFFER temp_tx_buf = {
        .data = {0,0,0,0,0,0,0,0},
        .dlc = length,
        .id = id,
		.xtd = true,
    };
    
    for(int i = 0; i < length && i < 8; i++)
	{
        temp_tx_buf.data[i] = data[i];
	}
		
    MCAN0_MessageTransmitFifo(1,&temp_tx_buf);
}
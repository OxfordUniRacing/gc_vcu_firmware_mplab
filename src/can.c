//=============================INCLUDES
#include "peripheral/mcan/plib_mcan0.h"
#include "peripheral/mcan/plib_mcan_common.h"

#include <xc.h>
#include "user.h"
#include "can.h"
#include "timer.h"
//==============================DEFINITIONS

//CAN Ids
#define CAN_ID_PEDAL_BOARD	0x100
#define CAN_ID_BMS_CELL_BROADCAST 0x6D0 
#define CAN_ID_AUX_STATES		0x900
#define CAN_ID_RTD          0x469;

#define CAN_RX_BUFFER_SIZE 16

//=============================GLOBAL VAR

bms_t bms = {0};

//============================LOCAL VAR

//uint8_t Mcan0MessageRAM[MCAN0_MESSAGE_RAM_CONFIG_SIZE] __attribute__((aligned (32)))__attribute__((space(data), section (".ram_nocache")));

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
//===========================================GLOBAL FUNC

void send_can(void)
{
    MCAN_TX_BUFFER temp_tx_buf = {
		.data = {50,51,52,53,54,55,56,57},
		.dlc = 8,
		.id = 0x0A1,
        .sof = 1
	};
	
	MCAN0_MessageTransmitFifo(1,&temp_tx_buf);
}

int handle_can(void)
{	
	
	
	uint32_t status;
	
	status = MCAN0_ErrorGet();
	
	uint32_t error_counts;
	error_counts = MCAN0_REGS->MCAN_ECR;
	
    //MCAN_RX_BUFFER can_temp = {0};
	/*
    if((status & MCAN_PSR_LEC_Msk) == MCAN_ERROR_NONE)
	{
		//__builtin_software_breakpoint();
		
		if(MCAN0_MessageReceiveFifo(MCAN_RX_FIFO_0, 1, &can_temp))
		{
			char temp_buf[256] = {0};
			char *temp_ptr = temp_buf;
			temp_ptr += snprintf(temp_buf,256,"Id: %u, MSG: ",can_temp.id);
			for(uint8_t i = 0; i < 8; i++)
			{
				temp_ptr += snprintf(temp_ptr,5, "%02x ", can_temp.data[i]);
			}
			snprintf(temp_ptr, 5, "\n\r");
			SYS_CONSOLE_PRINT(temp_buf);
		}
	}
	else if((status & MCAN_PSR_LEC_Msk) != MCAN_ERROR_LEC_NO_CHANGE)
	{
		SYS_CONSOLE_PRINT("Can Error: %08x \n\r",status);
	}
	
	if(( status & MCAN_PSR_EW_Msk) == MCAN_PSR_EW(1))
	{
		SYS_CONSOLE_PRINT("WARNING: Error CAN State \n\r");
		init_can();
		//MCAN0_SleepModeExit();
	}
    */
	
	if(can_rx_queue_len > 0)
	{
		MCAN_RX_BUFFER *buf;
		buf = can_rx_queue_pop();
		//Take pedal board

		switch(buf->id)
		{
			case CAN_ID_PEDAL_BOARD:
                comms_time.pb = current_time_ms();
                if(buf->data[0]>>7&1){
                    int pedal_val = buf->data[1];
                    
                    return pedal_val;
                }
				break;

			case CAN_ID_BMS_CELL_BROADCAST:
                comms_time.bms = current_time_ms();
                bms.voltage = (((uint16_t)buf->data[2] << 8) + buf->data[3])/10;
				break;

			//case CAN_ID_AUX_STATES:
				//comms_time.bms = current_time_ms();
               // break;
            
            /*case CAN_ID_RTD:
                
                break;*/
		}
		
		
	}
    return -1;
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
//=============================INCLUDES
#include "peripheral/mcan/plib_mcan0.h"
#include "peripheral/mcan/plib_mcan_common.h"

#include <xc.h>
//==============================DEFINITIONS

//CAN Ids
#define CAN_ID_PEDAL_BOARD	0x100
#define CAN_ID_BMS_CELL_BROADCAST 0x6B0 
#define CAN_ID_AUX_STATES		0x900

#define CAN_RX_BUFFER_SIZE 16

//=============================GLOBAL VAR



//============================LOCAL VAR

struct MCAN_RX_BUFFER can_rx_queue[CAN_RX_BUFFER_SIZE];
uint8_t can_rx_data_buffer[CAN_RX_BUFFER_SIZE][8];
uint8_t can_rx_queue_head = 0;
uint8_t can_rx_queue_tail = 0;
uint8_t can_rx_queue_len = 0;


//===================================LOCAL FUNC DECLARATIONS

void can_rx_callback(uint8_t numberOfMessage, uintptr_t contextHandle);
//===========================================GLOBAL FUNC

void handle_can(void)
{	
	MCAN_RX_BUFFER *buf;
	
	//Take pedal board
	
	switch(buf->id)
	{
		case CAN_ID_PEDAL_BOARD:
			break;
			
		case CAN_ID_BMS_CELL_BROADCAST:
			break;
			
		case CAN_ID_AUX_STATES:
			break;
	}
}

void init_can(void)
{
	can_rx_queue_initialise();

	MCAN0_Initialize();
	MCAN0_RxFifoCallbackRegister(MCAN_RX_FIFO_0, can_rx_callback, (uintptr_t)(NULL));



}

//=====================================LOCAL FUNC
void can_rx_callback(uint8_t numberOfMessage, uintptr_t contextHandle)
{
	MCAN_RX_BUFFER* can_temp;
	MCAN0_MessageReceiveFifo(MCAN_RX_FIFO_0, numberOfMessage, &can_temp);	
}

//Sets up the buffer for the CAN rx queue
void can_rx_queue_initialise(void)
{
	for(uint8_t i = 0; i < CAN_RX_BUFFER_SIZE;i++)
	{
		can_rx_queue[i].data = can_rx_data_buffer[i];
	}
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
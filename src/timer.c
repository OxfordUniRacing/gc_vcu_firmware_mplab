//====================INLUCDES=============================

#include <xc.h>
#include <stdbool.h>
#include "user.h"
#include "timer.h"

#include "peripheral/tc/plib_tc0.h"
#include "peripheral/tc/plib_tc_common.h"

//====================================DEFINITIONS===============================
#define TIMEOUT_INV1	500
#define TIMEOUT_INV2	500
#define TIMEOUT_PB		500
#define TIMEOUT_BMS		500

#define TX_PERIOD_INV1  50
#define TX_PERIOD_INV2  50
#define TX_PERIOD_BMS   100
#define TX_PERIOD_LOGGER    500
#define TX_PERIOD_DCL   500

//=====================================GLOBAL VARIABLES========================

comms_active_t comms_active = {0};
comms_time_t comms_time = {
    
    .inv1 = -500,
    .inv2 = -500,
    .bms = -500,
    .pb = -500
};
tx_ready_t tx_ready = {0};
tx_time_t tx_time = {
    
    .inv1 = 0,
    .inv2 = 0,
    .logger = 0,
    .bms = 0,
};

//=====================================LOCAL VARIABLES=========================

static volatile uint32_t ms_timer_0 = 0;
static volatile uint32_t ms_timer_1 = 1;
static volatile bool ms_timer_flipflop;

//================================LOCAL FUNCTION DECLARATIONS===================
void timer_callback(TC_TIMER_STATUS status, uintptr_t context);

//=================================GLOBAL FUNCTIONS=============================

void init_timer(void)
{
	TC0_CH0_TimerCallbackRegister(timer_callback, (uintptr_t)(NULL));
	TC0_CH0_TimerStart();
}

bool has_delay_passed(uint32_t start_time, uint32_t delay)
{
	if ((current_time_ms() - start_time) > delay) return true;
	else return false;
}

uint32_t current_time_ms(void)
{
	if(ms_timer_flipflop == 1)	return ms_timer_1/4;
	else						return ms_timer_0/4;
}

void handle_timeouts(void)
{
    
    
    
	if(has_delay_passed(comms_time.inv1,TIMEOUT_INV1))	{comms_active.inv1 = false; //SYS_CONSOLE_PRINT("inv1 timeout");
    }
	else												comms_active.inv1 = true;
	
	if(has_delay_passed(comms_time.inv2,TIMEOUT_INV2))	{comms_active.inv2 = false; //SYS_CONSOLE_PRINT("inv2 timeout");
    }
	else												comms_active.inv2 = true;
	
	if(has_delay_passed(comms_time.pb,TIMEOUT_PB))		{comms_active.pb = false; //SYS_CONSOLE_PRINT("pb timeout");
    }
	else												comms_active.pb = true;
	
	if(has_delay_passed(comms_time.bms,TIMEOUT_BMS))	{comms_active.bms = false; //SYS_CONSOLE_PRINT("bms timeout");
    }
	else												comms_active.bms = true;
	
}

void handle_tx_timer(void){
    
    if(has_delay_passed(tx_time.inv1,TX_PERIOD_INV1))	{tx_ready.inv1 = true; //SYS_CONSOLE_PRINT("inv1 tx");
    }
	else												tx_ready.inv1 = false;
	
	if(has_delay_passed(tx_time.inv2,TX_PERIOD_INV2))	{tx_ready.inv2 = true; //SYS_CONSOLE_PRINT("inv2 tx");
    }
	else												tx_ready.inv2 = false;
	
	if(has_delay_passed(tx_time.logger,TX_PERIOD_LOGGER))		{tx_ready.logger = true; //SYS_CONSOLE_PRINT("log tx");
    }
	else												tx_ready.logger = false;
	
	if(has_delay_passed(tx_time.bms,TX_PERIOD_BMS))	{tx_ready.bms = true; //SYS_CONSOLE_PRINT("bms tx");
    }
	else												tx_ready.bms = false;
    if(has_delay_passed(tx_time.dcl_inv1,TX_PERIOD_DCL))	{tx_ready.dcl_inv1 = true; //SYS_CONSOLE_PRINT("dcl_inv1 tx");
    }
	else												tx_ready.dcl_inv1 = false;
    if(has_delay_passed(tx_time.dcl_inv2,TX_PERIOD_DCL))	{tx_ready.dcl_inv2 = true; //SYS_CONSOLE_PRINT("dcl_inv1 tx");
    }
	else												tx_ready.dcl_inv2 = false;
}
//=================================LOCAL FUNCTIONS==============================

void timer_callback(TC_TIMER_STATUS status, uintptr_t context)
{
	if(ms_timer_flipflop == 1)		ms_timer_0 += 2;
	else							ms_timer_1 += 2;	
	
	ms_timer_flipflop ^= 1;
	
}
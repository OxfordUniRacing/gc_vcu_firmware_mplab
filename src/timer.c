//====================INLUCDES=============================

#include <xc.h>
#include <stdbool.h>
#include "user.h"
#include "timer.h"
#include "inverter.h"
#include "precharge.h"

#include "peripheral/tc/plib_tc0.h"
#include "peripheral/tc/plib_tc_common.h"
#include "car_control.h"

//====================================DEFINITIONS===============================
#define TIMEOUT_INV1_ACTIVE	2500
#define TIMEOUT_INV2_ACTIVE	2500
#define TIMEOUT_INV1_INACTIVE   2500
#define TIMEOUT_INV2_INACTIVE   2500
#define TIMEOUT_PB		200
#define TIMEOUT_BMS		200
#define TIMEOUT_DASH    500
#define TIMEOUT_STEERING    500

#define TX_PERIOD_INV1  50
#define TX_PERIOD_INV2  50
#define TX_PERIOD_BMS   100
#define TX_PERIOD_LOGGER    100
#define TX_PERIOD_STATUS    1000

#define STARTUP_GRACE_PERIOD    2000

//=====================================GLOBAL VARIABLES========================

comms_active_t comms_active = {0};
comms_active_t comms_active_snapshot = {0};
comms_time_t comms_time = {0};
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

static volatile bool startup_flag = false;
static volatile uint32_t startup_timer = 0;

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

void pause(uint32_t delay_ms){
    uint32_t start_time = current_time_ms();
    while(!has_delay_passed(start_time,delay_ms));
}

uint32_t current_time_ms(void)
{
	if(ms_timer_flipflop == 1)	return ms_timer_1/4;
	else						return ms_timer_0/4;
}

void handle_timeouts(void)
{
    if(!startup_flag){
        startup_flag = true;
        startup_timer = current_time_ms();
    }
    
    
	if(has_delay_passed(comms_time.inv1,TIMEOUT_INV1_ACTIVE) && inv1.active_drive)	{comms_active.inv1 = false; //SYS_CONSOLE_PRINT("inv1 active timeout");
    }
    else if(has_delay_passed(comms_time.inv1,TIMEOUT_INV1_INACTIVE) && !inv1.active_drive)  {comms_active.inv1 = false; //SYS_CONSOLE_PRINT("inv1 inactive timeout");
    }
	else												comms_active.inv1 = true;
	
	if(has_delay_passed(comms_time.inv2,TIMEOUT_INV2_ACTIVE) && inv2.active_drive)	{comms_active.inv2 = false; //SYS_CONSOLE_PRINT("inv2 active timeout");
    }
    else if(has_delay_passed(comms_time.inv2,TIMEOUT_INV1_INACTIVE) && !inv2.active_drive)  {comms_active.inv2 = false; //SYS_CONSOLE_PRINT("inv1 inactive timeout");
    }
	else												comms_active.inv2 = true;
	
	if(has_delay_passed(comms_time.pb,TIMEOUT_PB))		{comms_active.pb = false; //SYS_CONSOLE_PRINT("pb timeout");
    }
	else												comms_active.pb = true;
	
	if(has_delay_passed(comms_time.bms,TIMEOUT_BMS))	{comms_active.bms = false; //SYS_CONSOLE_PRINT("bms timeout");
    }
	else												comms_active.bms = true;
	
    if(has_delay_passed(comms_time.dash,TIMEOUT_DASH))	{comms_active.dash = false; //SYS_CONSOLE_PRINT("dash timeout");
    }
	else												comms_active.dash = true;
    
    if(has_delay_passed(comms_time.dash,TIMEOUT_STEERING))	{comms_active.steering = false; //SYS_CONSOLE_PRINT("steering timeout");
    }
	else												comms_active.steering = true;
    
    //handle all of the vital timeouts breaking the ass loop
    bool ass_break_loop_condition = (!comms_active.inv1 && car_control.precharge_ready) || 
                                (!comms_active.inv2 && car_control.precharge_ready) ||
                                !comms_active.bms ||
                                !comms_active.pb;
    if(has_delay_passed(startup_timer,STARTUP_GRACE_PERIOD) && ass_break_loop_condition){
        if(!ass.break_loop_timeout){ 
            comms_active_snapshot = comms_active;
        }
        ass.break_loop_timeout = true;
    }
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
    
    if(has_delay_passed(tx_time.status,TX_PERIOD_STATUS))	{tx_ready.status = true; //SYS_CONSOLE_PRINT("status tx");
    }
	else												tx_ready.status = false;
}
//=================================LOCAL FUNCTIONS==============================

void timer_callback(TC_TIMER_STATUS status, uintptr_t context)
{
	if(ms_timer_flipflop == 1)		ms_timer_0 += 2;
	else							ms_timer_1 += 2;	
	
	ms_timer_flipflop ^= 1;
	
}
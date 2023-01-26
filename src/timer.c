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

//=====================================GLOBAL VARIABLES========================

comms_active_t comms_active = {0};
comms_time_t comms_time = {0};

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
	if(ms_timer_flipflop == 1)	return ms_timer_1;
	else						return ms_timer_0;
}

void handle_timeouts(void)
{
	if(has_delay_passed(comms_time.inv1,TIMEOUT_INV1))	comms_active.inv1 = false;
	else												comms_active.inv1 = true;
	
	if(has_delay_passed(comms_time.inv2,TIMEOUT_INV2))	comms_active.inv2 = false;
	else												comms_active.inv2 = true;
	
	if(has_delay_passed(comms_time.pb,TIMEOUT_PB))		comms_active.pb = false;
	else												comms_active.pb = true;
	
	if(has_delay_passed(comms_time.bms,TIMEOUT_BMS))	comms_active.bms = false;
	else												comms_active.bms = true;
	
}
//=================================LOCAL FUNCTIONS==============================

void timer_callback(TC_TIMER_STATUS status, uintptr_t context)
{
	if(ms_timer_flipflop == 1)		ms_timer_0 += 2;
	else							ms_timer_1 += 2;	
	
	ms_timer_flipflop ^= 1;
}
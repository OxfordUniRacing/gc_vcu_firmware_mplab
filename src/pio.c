//====================INCLUDES==================================================
#include <xc.h>
#include <stdbool.h>
#include "pio.h"
#include "timer.h"
#include "precharge.h"

#include "peripheral/pio/plib_pio.h"

//===================DEFINITIONS================================================
#define ASS_CLOSED 1
#define ASS_OPEN 0
#define TS_ACTIVE_BOUNCE_TIME 30

//===================GLOBAL VARIABLES===========================================

//===================LOCAL VARIABLES============================================
static bool ts_active = false;
static bool debounce_countdown_started = false;
static uint32_t debounce_timer = -500;

//===================LOCAL FUNCTION DECLARATIONS================================

//===================GLOBAL FUNCTIONS===========================================

void init_pio(void){
    TS_INPUT_InputEnable();
    ASS_PIN_RELAY_OutputEnable();
}

void handle_pio(void){
    bool ass_close =	!ass.break_loop_precharge &&
						!ass.break_loop_ts_deactive &&
						!ass.break_loop_inverter_error &&
                        !ass.break_loop_bms_not_responding_to_precharge_message;
	
	bool new_ass_state = ass_close ? ASS_CLOSED : ASS_OPEN;	
    
    PIO_PinWrite(ASS_PIN_RELAY_PIN, new_ass_state);
    
    if(ts_active != TS_INPUT_Get()){
        if(debounce_countdown_started){
            if(has_delay_passed(debounce_timer,TS_ACTIVE_BOUNCE_TIME)){
                ts_active = TS_INPUT_Get();
            }
            else{
                debounce_timer = current_time_ms();
            }
        }
        else{
            debounce_countdown_started = true;
            debounce_timer = current_time_ms();
        }
    }
}

bool ts_active(void){
    return ts_active;
}
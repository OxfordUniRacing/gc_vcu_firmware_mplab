//====================INCLUDES==================================================
#include <xc.h>
#include <stdbool.h>
#include "pio.h"
#include "timer.h"

#include "peripheral/pio/plib_pio.h"

//===================DEFINITIONS================================================
#define ASS_CLOSED 1
#define ASS_OPEN 0

//===================GLOBAL VARIABLES===========================================
ass_t ass = {0};

//===================LOCAL VARIABLES============================================

//===================LOCAL FUNCTION DECLARATIONS================================

//===================GLOBAL FUNCTIONS===========================================

void init_pio(void){
    TS_INPUT_InputEnable();
    ASS_PIN_RELAY_OutputEnable();
}

void handle_ass(void){
    bool ass_close =	!ass.break_loop_precharge; //||
						//!ass.break_loop_wantToStart;
	bool new_ass_state = ass_close ? ASS_CLOSED : ASS_OPEN;	
    
    PIO_PinWrite(ASS_PIN_RELAY_PIN, new_ass_state);
}

void handle_relay(void){
    
}

bool ts_active(void){
    return TS_INPUT_Get();
}
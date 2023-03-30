//====================INCLUDES==================================================
#include "car_control.h"

//===================DEFINITIONS================================================
#define THR_DEADZONE 2 //throttle deadzone as a percentage of max throttle

//===================GLOBAL VARIABLES===========================================
control_t car_control = {0};

//===================LOCAL VARIABLES============================================

//===================LOCAL FUNCTION DECLARATIONS================================


//===================GLOBAL FUNCTIONS===========================================

int get_inv1_cmd(void){
    if(car_control.user_pedal_value < THR_DEADZONE) return 0;
    if(car_control.user_pedal_value > 100) return 100/12;
    return car_control.user_pedal_value/12;
}

int get_inv2_cmd(void){
    if(car_control.user_pedal_value < THR_DEADZONE) return 0;
    if(car_control.user_pedal_value > 100) return 100/12;
    return car_control.user_pedal_value/12;
}

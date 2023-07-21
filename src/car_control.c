//====================INCLUDES==================================================
#include "car_control.h"
#include "precharge.h"

//===================DEFINITIONS================================================
#define THR_DEADZONE 2 //throttle deadzone as a percentage of max throttle
#define min(x,y) (x < y ? x : y)

#define THROTTLE_SCALE_DOWN 1

#define REFERENCE   3.2
#define GAIN        24

//===================GLOBAL VARIABLES===========================================
control_t car_control = {0};

//===================LOCAL VARIABLES============================================

//===================LOCAL FUNCTION DECLARATIONS================================

//===================GLOBAL FUNCTIONS===========================================

int get_inv1_cmd(void){
    uint8_t p = car_control.user_pedal_value/THROTTLE_SCALE_DOWN;
    if(p < THR_DEADZONE) return 0;
    
    return p;
}

int get_inv2_cmd(void){
    uint8_t p = car_control.user_pedal_value/THROTTLE_SCALE_DOWN;
    if(p < THR_DEADZONE) return 0;
    
    return p;
}

void handle_ins(void){
    /*if(car_control.user_steering_value > 0.1 && car_control.yaw_rate < -0.05){
        ass.break_loop_ins_detect = true;
        car_control.ins_error_code = 1;
    }
    
    if(car_control.user_steering_value < -0.1 && car_control.yaw_rate > 0.05){
        ass.break_loop_ins_detect = true;
        car_control.ins_error_code = 2;
    }
    
    if(car_control.v_x > 5.3 && car_control.v_acc < 0.1){
        ass.break_loop_ins_detect = true;
        car_control.ins_error_code = 3;
    }
    
    if(car_control.a_x > 4.9){
        ass.break_loop_ins_detect = true;
        car_control.ins_error_code = 4;
    }*/
}
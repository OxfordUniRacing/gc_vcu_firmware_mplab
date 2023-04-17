//====================INCLUDES==================================================
#include "car_control.h"
#include "precharge.h"

//===================DEFINITIONS================================================
#define THR_DEADZONE 2 //throttle deadzone as a percentage of max throttle
#define min(x,y) (x < y ? x : y)

//===================GLOBAL VARIABLES===========================================
control_t car_control = {0};

//===================LOCAL VARIABLES============================================
static const bool torque_vectoring_active = false;

//===================LOCAL FUNCTION DECLARATIONS================================
static float expf_fast(float x);
static float get_coefficient(uint8_t pedal_value);

//===================GLOBAL FUNCTIONS===========================================

int get_inv1_cmd(void){
    uint8_t p = car_control.user_pedal_value/6;
    if(p < THR_DEADZONE) return 0;
    
    //check for steering inactive / out of range or brake on
    float s = car_control.user_steering_value;
    if(s < -1 || s > 1 || car_control.brake_on || !torque_vectoring_active) 
        return p;
    
    //right turn, left inverter controls the outside wheel
    if(s > 0){
        return min(p*(2.0f-expf_fast(-s*get_coefficient(p))),100);
    }
    //left turn, left inverter controls the inside wheel
    else if(s < 0){
        s = -s;
        return p*expf_fast(-s*get_coefficient(p));
    }
    else{
        return p;
    }
}

int get_inv2_cmd(void){
    uint8_t p = car_control.user_pedal_value/6;
    if(p < THR_DEADZONE) return 0;
    
    //check for steering inactive / out of range or brake on
    float s = car_control.user_steering_value;
    if(s < -1 || s > 1 || car_control.brake_on) 
        return p;
    
    //right turn, right inverter controls the inside wheel
    if(s > 0){
        return p*expf_fast(-s*get_coefficient(p));
    }
    //left turn, right inverter controls the outside wheel
    else if(s < 0){
        s = -s;
        return min(p*(2.0f-expf_fast(-s*get_coefficient(p))),100);
    }
    else{
        return p;
    }
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
    
    car_control.torque_vectoring_active = torque_vectoring_active;
}

//upper bound approximation of exp(x) based on IEEE754 manipulation
static float expf_fast(float x){
    static union {float f; int i;} u;
    u.i = (int)(12102203 * x + 1065353217);
    return u.f;
}

static float get_coefficient(uint8_t pedal_value){
    float u = (float)pedal_value;
    return 3*((u>0)*(0.36*u) + (u>10)*(3.6-0.36*u) + (u>50)*(-0.18*(u-50)) + (u>70)*(-3.6+0.18*(u-50)));
}
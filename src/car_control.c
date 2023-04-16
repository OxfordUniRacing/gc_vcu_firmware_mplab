//====================INCLUDES==================================================
#include "car_control.h"
#include "precharge.h"

//===================DEFINITIONS================================================
#define THR_DEADZONE 2 //throttle deadzone as a percentage of max throttle
#define min(x,y) (x < y ? x : y)

//===================GLOBAL VARIABLES===========================================
control_t car_control = {0};

//===================LOCAL VARIABLES============================================

//===================LOCAL FUNCTION DECLARATIONS================================
static float expf_fast(float x);
static float get_coefficient(uint8_t pedal_value);

//===================GLOBAL FUNCTIONS===========================================

int get_inv1_cmd(void){
    uint8_t p = car_control.user_pedal_value;
    if(p < THR_DEADZONE) return 0;
    
    //check for steering inactive / out of range or brake on
    float s = car_control.user_steering_value;
    if(s < -1 || s > 1 || car_control.brake_on) 
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
    uint8_t p = car_control.user_pedal_value;
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
    if(car_control.user_steering_value > 0.1 && car_control.yaw_rate < -0.05){
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
    }
}

//upper bound approximation of exp(x) based on IEEE754 manipulation
static float expf_fast(float x){
    static union {float f; int i;} u;
    u.i = (int)(12102203 * x + 1065353217);
    return u.f;
}

//3sin(pi*x/100) + 0.9sin(2pi*x/100) - 0.39sin(3pi*x/100) for range x 0:100
static float get_coefficient(uint8_t pedal_value){
    static const float lookup[101] =
    {
        0,
        0.1140,   0.2281,   0.3422,   0.4563,   0.5704,   0.6845,   0.7986,   0.9127,   1.0267,
        1.1405,   1.2542,   1.3676,   1.4806,   1.5931,   1.7049,   1.8159,   1.9260,   2.0349,
        2.1424,   2.2484,   2.3525,   2.4546,   2.5543,   2.6514,   2.7455,   2.8365,   2.9240,
        3.0077,   3.0873,   3.1625,   3.2330,   3.2984,   3.3587,   3.4133,   3.4621,   3.5049,
        3.5414,   3.5715,   3.5949,   3.6114,   3.6210,   3.6236,   3.6191,   3.6075,   3.5887,
        3.5628,   3.5298,   3.4900,   3.4433,   3.3900,   3.3303,   3.2644,   3.1926,   3.1151,
        3.0324,   2.9448,   2.8527,   2.7565,   2.6565,   2.5534,   2.4475,   2.3393,   2.2293,
        2.1180,   2.0059,   1.8935,   1.7813,   1.6698,   1.5594,   1.4506,   1.3439,   1.2396,
        1.1382,   1.0401,   0.9455,   0.8549,   0.7685,   0.6865,   0.6091,   0.5365,   0.4688,
        0.4062,   0.3486,   0.2961,   0.2487,   0.2061,   0.1684,   0.1354,   0.1068,   0.0825,
        0.0622,   0.0455,   0.0322,   0.0219,   0.0141,   0.0086,   0.0049,   0.0025,   0.0010,
        0
    };
    
    return lookup[pedal_value];
}
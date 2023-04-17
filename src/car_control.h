/* 
 * File:   car_control.h
 * Author: Ellis
 *
 * Created on 11 March 2023, 20:26
 */

#ifndef CAR_CONTROL_H
#define	CAR_CONTROL_H

#include <stdbool.h>
#include <xc.h>

typedef struct
{
	bool ready_to_drive;
    bool inverter_params_complete;
    bool precharge_ready;
    bool ignition;
    uint8_t ins_error_code;
	
	//User values
	uint8_t user_pedal_value;
    float user_steering_value;
    bool brake_on;
    float brake_pressure;
    
    bool torque_vectoring_active;
    
    //car state data
    float yaw_rate;
    float v_x;
    float v_acc;
    float a_x;
}control_t;

extern control_t car_control;

int get_inv1_cmd(void);
int get_inv2_cmd(void);

#endif	/* CAR_CONTROL_H */


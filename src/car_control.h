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
    bool rtd_startup_flag;
	
	//User values
	uint8_t user_pedal_value;
    uint16_t user_steering_value;
}control_t;

extern control_t car_control;

int get_inv1_cmd(void);
int get_inv2_cmd(void);

#endif	/* CAR_CONTROL_H */


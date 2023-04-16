#ifndef INVERTER_H
#define INVERTER_H

#include <xc.h>
#include <stddef.h>
#include <stdbool.h>

#define INVERTER_LEFT_ID    "906577530" //inverter left is inverter 1
#define INVERTER_RIGHT_ID   "1158235770" //inverter right is inverter 2

typedef struct {
	char inputmethod;
	float aux_input;
	float throttle_input;
	int pwm;
	float voltage;
	float phase_current;
	int rpm;
	int power_stage_temp;
	int motor_temp; // this is the one we want for dash display (to be sent across can)
    bool active_drive; //the inverter sends messages at a higher rate when they are in active drive - this is important for our control strategy
    long id;
    
    int POSITIVE_SLEW_RATE;
    int NEGATIVE_SLEW_RATE;
    int RESPONSE_TIME;
    int POLE_PAIRS;
	
}inv_t;

extern inv_t inv1;
extern inv_t inv2;

int inv_parse_rx(volatile char* msg, volatile size_t len, inv_t* inv, size_t (*io_write)(uint8_t*,const size_t) ); 
float get_inv_lowest_voltage(void);
int get_thr_cmd_str(int desired_thr, char output[], size_t size);
void handle_inverters(void);

#endif
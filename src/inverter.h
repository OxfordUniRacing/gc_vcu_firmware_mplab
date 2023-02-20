#ifndef INVERTER_H
#define INVERTER_H

#include <xc.h>
#include <stddef.h>

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
	
}inv_t;

extern inv_t inv1;
extern inv_t inv2;

void inv_parse_rx(volatile char* msg, volatile size_t len, inv_t* inv, size_t (*io_write)(uint8_t*,const size_t) ); 
uint16_t get_inv_lowest_voltage(void);

#endif
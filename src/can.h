#ifndef CAN_H
#define CAN_H

typedef struct {
	//inputs
	uint16_t voltage;
	
	//outputs
	bool precharge_enable;
}bms_t;

extern bms_t bms;

int handle_can(void);

void send_can(void);

void init_can(void);

#endif
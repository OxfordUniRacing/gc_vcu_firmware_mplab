#ifndef TIMER_H
#define TIMER_H


typedef struct
{
	bool inv1;
	bool inv2;
	bool pb;
	bool bms;
	
}comms_active_t;

extern comms_active_t comms_active;

typedef struct
{
	uint32_t inv1;
	uint32_t inv2;
	uint32_t pb;
	uint32_t bms;
	
}comms_time_t;

extern comms_time_t comms_time;

uint32_t current_time_ms(void);
bool has_delay_passed(uint32_t start_time, uint32_t delay);
void init_timer(void);
void handle_timeouts(void);

#endif
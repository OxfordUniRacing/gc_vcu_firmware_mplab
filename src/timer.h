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
	uint32_t dash;
	
}comms_time_t;

extern comms_time_t comms_time;

typedef struct
{
	bool inv1;
    bool inv2;
    bool logger;
	bool bms;
	
}tx_ready_t;

extern tx_ready_t tx_ready;

typedef struct
{
	uint32_t inv1;
    uint32_t inv2;
    uint32_t logger;
	uint32_t bms;
	
}tx_time_t;

extern tx_time_t tx_time;

uint32_t current_time_ms(void);
bool has_delay_passed(uint32_t start_time, uint32_t delay);
void init_timer(void);
void handle_timeouts(void);
void handle_tx_timer(void);

#endif
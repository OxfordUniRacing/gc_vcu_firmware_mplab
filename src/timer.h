#ifndef TIMER_H
#define TIMER_H


typedef struct
{
	bool inv1;
	bool inv2;
	bool pb;
	bool bms;
    bool dash;
    bool steering;
	
}comms_active_t;

extern comms_active_t comms_active;
extern comms_active_t comms_active_snapshot;

typedef struct
{
	uint32_t inv1;
	uint32_t inv2;
	uint32_t pb;
	uint32_t bms;
	uint32_t dash;
    uint32_t steering;
	
}comms_time_t;

extern comms_time_t comms_time;

typedef struct
{
	bool inv1;
    bool inv2;
    bool logger;
	bool bms;
    bool status;
	
}tx_ready_t;

extern tx_ready_t tx_ready;

typedef struct
{
	uint32_t inv1;
    uint32_t inv2;
    uint32_t logger;
	uint32_t bms;
    uint32_t status;
	
}tx_time_t;

extern tx_time_t tx_time;

uint32_t current_time_ms(void);
bool has_delay_passed(uint32_t start_time, uint32_t delay);
void pause(uint32_t delay_ms);
void init_timer(void);
void handle_timeouts(void);
void handle_tx_timer(void);

#endif
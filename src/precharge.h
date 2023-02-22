/* 
 * File:   precharge.h
 * Author: Ellis
 *
 * Created on 22 February 2023, 08:46
 */

#ifndef PRECHARGE_H
#define	PRECHARGE_H

typedef struct {
	//inputs
	uint16_t voltage;
    bool relay_state;
	
	//outputs
	bool precharge_enable;
    
}bms_t;

extern bms_t bms;

typedef struct  
{	
	//Turn off VCU ass relay conditions
	bool break_loop_precharge;
	bool break_loop_wantToStart;
}ass_t;

extern ass_t ass;

void handle_precharge(void);

#endif	/* PRECHARGE_H */


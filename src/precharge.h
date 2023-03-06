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
	float voltage;
    bool relay_state;
	
	uint16_t pack_dlc;	//Max current the battery can output
	
	//outputs
	bool precharge_enable;
	
	
	
    
}bms_t;

extern bms_t bms;

typedef struct  
{	
	//Turn off VCU ass relay conditions
	bool break_loop_precharge;				//True when we want to break ASS due to precharge
	bool break_loop_ts_deactive;			//True when we want to break ASS due to TS cutting out
	bool break_loop_inverter_error;			//True when we want to break ASS due to an inverter error
	//bool break_loop_wantToStart;
}ass_t;

extern ass_t ass;

void handle_precharge(void);

#endif	/* PRECHARGE_H */


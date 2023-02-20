/* 
 * File:   pio.h
 * Author: Ellis
 *
 * Created on 19 February 2023, 21:55
 */

#ifndef PIO_H
#define	PIO_H

typedef struct  
{	
	//Turn off VCU ass relay conditions
	bool break_loop_precharge;
	bool break_loop_wantToStart;
}ass_t;

extern ass_t ass;

void init_pio(void);
void handle_ass(void);
void handle_relay(void);
bool ts_active(void);

#endif	/* PIO_H */


//===============================INCLUDES
#include "inverter.h"
#include "user.h"
#include "timer.h"
#include <string.h>
#include "pio.h"
#include "car_control.h"
#include "globals.h"
#include "can_inverters.h"

//==========================DEFINITIONS


#define HC1_DRIVE_PERIOD		20
#define HC1_nDRIVE_PERIOD		200
#define HC2_PERIOD				200	
#define HC3_PERIOD				200

//==========================GLOBAL VAR
inv_t inv1;
inv_t inv2;
//==========================LOCAL VAR

//==========================LOCAL FUN DECLARATIONS

//=========================GLOBAL FUNCTIONS

void handle_inverters(void)
{   
	static uint32_t HC1_transmit_time = 0;
	static uint32_t HC2_transmit_time = - 5;
	static uint32_t HC3_transmit_time = - 15;
	
	/*
	 * We always want to be sending all HC1,2,3 at 200ms when not ready to drive
	 * 
	 * When we are ready to drive, up the rate of HC1 to 5-10ms
	 */
	
	if(car_control.ready_to_drive)
	{
		if( has_delay_passed(HC1_transmit_time, HC1_DRIVE_PERIOD))
		{
			update_HC1_drive();
			
			HC1_transmit_time = current_time_ms();
		}
	}
	else
	{
		if( has_delay_passed(HC1_transmit_time, HC1_nDRIVE_PERIOD))
		{
			update_HC1_shutdown();
			
			HC1_transmit_time = current_time_ms();
		}
	}
	
	
	if( has_delay_passed(HC2_transmit_time, HC2_PERIOD))
	{
		update_HC2();

		HC2_transmit_time = current_time_ms();
	}
	else if( has_delay_passed(HC3_transmit_time, HC3_PERIOD))
	{
		update_HC3();

		HC3_transmit_time = current_time_ms();
	}

	//If comms have broken to the inverters, set the voltage to default (0))
    if(!comms_active.inv1){
        inv1.voltage = 0;
    }
    
    if(!comms_active.inv2){
        inv2.voltage = 0;
    }
}

//returns 0 if successful, -1 if we've read past the buffer, <-1 if there's something wrong with the message (i.e. it doesn't find a parameter), and a positive int if there's an error code 
int inv_parse_rx(char* msg, size_t len, inv_t* inv, size_t (*io_write)(uint8_t*,const size_t) ) // @@ Check if we can read the inverter stuff for reading the voltage
{
	// IO DESCRIPTOR ARG Is for writing the s
	
	// Startup check - when the inverters start they send a menu with a * character which we should ignore, 
	// Therefore, only do the rest of the code (pare into the struct) when st_c = 0;
    // also leaves the flag as 1 if the inverters are in analog mode
	
	int st_c = 1;
    const char *possible_msg_starts[] = {"Error\n\r", "*", "T=", "S=", "t=", "s="};
    int msg_start_case;
    char *msg_start;
    
    for(msg_start_case = 0; msg_start_case < 6; msg_start_case++)
	{
        msg_start = strstr(msg,possible_msg_starts[msg_start_case]);
        if(msg_start != NULL)
            break;
    }
    
    char *id_loc1 = NULL;
    char *id_loc2 = NULL;
    
	// Check for garbage
	switch(msg_start_case)
	{
		//*
		case 1: // garbled start up message
			st_c = 1;
            id_loc1 = strstr(msg,INVERTER_LEFT_ID);
            if(id_loc1 != NULL){
                inv->id = strtol(INVERTER_LEFT_ID,NULL,10);
                return 0;
            }
            id_loc2 = strstr(msg,INVERTER_RIGHT_ID);
            if(id_loc2 != NULL){
                inv->id = strtol(INVERTER_RIGHT_ID,NULL,10);
                return 0;
            }
			break;
		// T=
		case 2: // active analogue - happens normally on startup but shouldn't happen afterward. If it does, we want an error state
			st_c = 0;
            if(car_control.precharge_ready) return -4;
			break;
		// S=
		case 3:
			st_c = 0;
			break;
		//t=
		case 4: // inactive analogue - again, justification for an error state if this happens after startup has finished
			// Change to 's'
			st_c = 0;
			if(car_control.precharge_ready) return -4;
			break; 
		//s=
		case 5:
			st_c = 0;
			break;
		//Error
        case 0:
            return strtol(msg_start+sizeof("Errors= 0x"),NULL,16);
		default:
            id_loc1 = strstr(msg,INVERTER_LEFT_ID);
            if(id_loc1 != NULL){
                inv->id = strtol(INVERTER_LEFT_ID,NULL,10);
                return 0;
            }
            id_loc2 = strstr(msg,INVERTER_RIGHT_ID);
            if(id_loc2 != NULL){
                inv->id = strtol(INVERTER_RIGHT_ID,NULL,10);
                return 0;
            }
            return -3;
            //return 0;
	}

	
	if (st_c == 0) //  if its not start up noise, do the good shit
	{
		char *curr = (char*)msg_start;
		
			// Get the message and put in struct
			#define ERROR_CHECK_BUF_OVERFLOW if ((uintptr_t)curr > (uintptr_t)msg_start+len) return -1;
            #define ERROR_CHECK_MISSING_PARAM if (curr == NULL) return -2;

			inv->throttle_input = strtof(curr+sizeof("S"), &curr);
            
            curr = strstr(curr,"a=") != NULL ? strstr(curr,"a=") : strstr(curr,"A=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM  
			inv->aux_input = strtof(curr+sizeof("a"), &curr);
            
            curr = strstr(curr,"PWM=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->pwm = strtol(curr+sizeof("PWM"), &curr, 10);
            
            curr = strstr(curr,"U=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->voltage = strtof(curr+sizeof("U"), &curr);
            
            curr = strstr(curr,"I=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->phase_current = strtof(curr+sizeof("I"), &curr);
            
            curr = strstr(curr,"RPM=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->rpm = strtol(curr+sizeof("RPM"), &curr, 10);
            
            curr = strstr(curr,"con=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->power_stage_temp = strtol(curr+sizeof("con"), &curr, 10);
            
            curr = strstr(curr,"mot=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
            inv->motor_temp = strtol(curr+sizeof("mot"), &curr, 10);
            
			#undef ERROR_CHECK_BUF_OVERFLOW
            #undef ERROR_CHECK_MISSING_PARAM
            
            //for debugging
            
			//SYS_CONSOLE_PRINT("Throttle Input: %f\n\r", inv->throttle_input);
			//SYS_CONSOLE_PRINT("Aux Input: %f\n\r", inv->aux_input);
			//SYS_CONSOLE_PRINT("PWM: %d\n\r", inv->pwm);
			//SYS_CONSOLE_PRINT("Voltage: %f\n\r", inv->voltage);
            //SYS_CONSOLE_PRINT("Current: %f\n\r", inv->phase_current);
            //SYS_CONSOLE_PRINT("RPM: %d\n\r", inv->rpm);
			//SYS_CONSOLE_PRINT("mot: %d\n\r", inv->motor_temp);	
	}
    
 
    return 0;
}

float get_inv_lowest_voltage(void)
{
	if( inv1.voltage < inv2.voltage) return inv1.voltage;
	else return inv2.voltage;
}

// This function takes an integer between 0 and 100, fills a buffer with a 
// Plettenberg motor command, and returns the length of the command
int get_thr_cmd_str(int desired_thr, char output[], size_t size)
{
    char* ptr = output;
    
    if(desired_thr == 100){
        ptr += snprintf(ptr,2,"m");
        return 1;
    }
	if(desired_thr == 0){
		ptr += snprintf(ptr,2,"0");
		return 1;
	}
	
	int length = 0;
	//decide first char: '1' - '9'
	int firstdec = (int)(desired_thr / 10);
	if(firstdec > 0){		// if 10% <= desired_thr <= 99%
        ptr += snprintf(ptr,2,"%d",firstdec);
		desired_thr -= 10 * firstdec;
		length += 1;
		
		// decide number of '+'
		int seconddec = (int)(desired_thr);
		for(int i = 0; i < seconddec; i++)
		{
            ptr += snprintf(ptr,2,"+");
		}
		desired_thr -= seconddec;
		length += seconddec;
        
        ptr += snprintf(ptr,2,"f");
        length++;
		
		//snprintf(ptr,2,"\n\r");
		//length += 2;
		
        return length;
	}
    else
	{							// if 0% <= desired_thr <= 9%
		//first letter must be '1'
        ptr += snprintf(ptr,2,"1");
		length += 1;
		
		// decide number of '+'
		int seconddec = (int)desired_thr;
		for(int i = length; i < length + (10-seconddec); i++){
			//output->buf[i] = '-';
            ptr += snprintf(ptr,2,"-");
		}
		desired_thr -= seconddec;
		length += (10-seconddec);
        
        ptr += snprintf(ptr,2,"f");
        length++;
		
		//snprintf(ptr,2,"\n\r");
		//length += 2;
		
		return length;
	}
}

//=========================LOCAL FUNCTIONS======================================
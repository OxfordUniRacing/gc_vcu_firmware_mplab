//===============================INCLUDES
#include "inverter.h"
#include "user.h"
#include "timer.h"
#include <string.h>
#include "pio.h"
#include "car_control.h"

//==========================DEFINITIONS


//==========================GLOBAL VAR
inv_t inv1;
inv_t inv2;
//==========================LOCAL VAR

//==========================LOCAL FUN DECLARATIONS

//=========================GLOBAL FUNCTIONS

void handle_inverters(void)
{   
    if(car_control.ready_to_drive){ 
        if(!inv1.active_drive && get_inv1_cmd() > 0){
            //start with empty buffer long enough for any command
            char thr_cmd[128] = {0};
            //use helper function to fill buffer, actual length of command returned from
            //helper function so that I don't write unnecessary characters
            int length = get_thr_cmd_str(car_control.user_pedal_value,thr_cmd,128);
            UART1_Write((uint8_t*)thr_cmd,length);	
            inv1.active_drive = true;
        }
        
        if(!inv2.active_drive && get_inv2_cmd() > 0){
            //start with empty buffer long enough for any command
            char thr_cmd[128] = {0};
            //use helper function to fill buffer, actual length of command returned from
            //helper function so that I don't write unnecessary characters
            int length = get_thr_cmd_str(car_control.user_pedal_value,thr_cmd,128);
            UART2_Write((uint8_t*)thr_cmd,length);	
            inv2.active_drive = true;
        }
	}
    
    else if(inv1.active_drive || inv2.active_drive){
        UART1_Write("0",1);
        UART2_Write("0",1);
        inv1.active_drive = false;
        inv2.active_drive = false;
    }
    
    if(!comms_active.inv1){
        inv1.voltage = 0;
    }
    
    if(!comms_active.inv2){
        inv2.voltage = 0;
    }
}

//returns 0 if successful, -1 if we've read past the buffer, <-1 if there's something wrong with the message (i.e. it doesn't find a parameter), and a positive int if there's an error code 
int inv_parse_rx(volatile char* msg, volatile size_t len, inv_t* inv, size_t (*io_write)(uint8_t*,const size_t) ) // @@ Check if we can read the inverter stuff for reading the voltage
{
	// IO DESCRIPTOR ARG Is for writing the s
	
	// Startup check - when the inverters start they send a menu with a * character which we should ignore, 
	// Therefore, only do the rest of the code (pare into the struct) when st_c = 0;
    // also leaves the flag as 1 if the inverters are in analog mode
	
	int st_c = 1;
	
    SYS_CONSOLE_PRINT("INC: %s",msg);   //Print the message to the console
	
    const char *possible_msg_starts[] = {"Error", "*", "T=", "S=", "t=", "s="};
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
        
        ptr += snprintf(ptr,2,"r");
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
        
        ptr += snprintf(ptr,2,"r");
        length++;
		
		//snprintf(ptr,2,"\n\r");
		//length += 2;
		
		return length;
	}
}

//=========================LOCAL FUNCTIONS======================================
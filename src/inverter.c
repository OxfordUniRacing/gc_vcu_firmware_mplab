//===============================INCLUDES
#include "inverter.h"
#include "user.h"
#include "app.h"
#include "timer.h"
#include <string.h>
#include "pio.h"

//==========================DEFINITIONS
#define THR_DEADZONE 1 //throttle deadzone as percentage of max throttle

//==========================GLOBAL VAR
inv_t inv1;
inv_t inv2;
//==========================LOCAL VAR

//==========================LOCAL FUN DECLARATIONS

int get_thr_cmd(int desired_thr, char output[], size_t size);

//=========================GLOBAL FUNCTIONS

void handle_inverter(void)
{   
    if(car_control.ready_to_drive)
	{
		//start with empty buffer long enough for any command
        char thr_cmd[128] = {0};
        //use helper function to fill buffer, actual length of command returned from
        //helper function so that I don't write unnecessary characters
        int length = get_thr_cmd(car_control.user_pedal_value,thr_cmd,128);
        //write same command to both motors
        
        
        if(tx_ready.inv1 && tx_ready.inv2){
            tx_time.inv1 = current_time_ms();
            tx_time.inv2 = current_time_ms();
            if(inv1.pwm/10 != car_control.user_pedal_value) UART1_Write((uint8_t*)thr_cmd,length);
            if(inv2.pwm/10 != car_control.user_pedal_value) UART2_Write((uint8_t*)thr_cmd,length);
        }
	}
	else
	{
		if(tx_ready.inv1 && tx_ready.inv2 && ts_active()){
            char cmd[3] = "s0";
            UART1_Write((uint8_t*)cmd, sizeof(cmd));
            UART2_Write((uint8_t*)cmd, sizeof(cmd));
        }
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
    
    char s_cmd[3] = "s0"; //command to set the inverters to serial and stop the motors just to be safe
	
    SYS_CONSOLE_PRINT("INC: %s",msg);   //Print the message to the console
	
    const char *possible_msg_starts[] = {"Error", "*", "T=", "S=", "t=", "s="};
    int msg_start_case;
    char *msg_start;
    
    for(msg_start_case = 0; msg_start_case < 6; msg_start_case++){
        msg_start = strstr(msg,possible_msg_starts[msg_start_case]);
        if(msg_start != NULL)
            break;
    }
    
    if(msg_start_case == 6){ //if we've made it all the way to the end of the loop, we have a bad message
        return -3;
    }
    
	// Check for garbage
	switch(msg_start_case)
	{
		case 1: // garbled start up message
			st_c = 1;
			break;
		case 2: // big letter active - we want to change but maybe we cant @@ as a future safety thing, may want to turn off inverter, send lowercase s and then turn on
			st_c = 1;
            io_write((uint8_t*)s_cmd,sizeof(s_cmd));
			break;
		case 3:
			st_c = 0;
			break;
		case 4: // inactive analogue
			// Change to 's'
			st_c = 1;
			io_write((uint8_t*)s_cmd,sizeof(s_cmd)); // length including null terminator 
			break; 
		case 5:
			st_c = 0;
			break;
        case 0:
            return strtol(msg_start+sizeof("Errors= 0x"),NULL,16);
		default:
            SYS_CONSOLE_PRINT("msg_start_case: %d\n\r",msg_start_case);
			return -2; // not any of those values so return (bad message!!!) 
	}

	
	if (st_c == 0) //  if its not start up noise, do the good shit
	{
		char *curr = (char*)msg_start;
		
			// Get the message and put in struct
			#define ERROR_CHECK_BUF_OVERFLOW if ((uintptr_t)curr > (uintptr_t)msg_start+len) return -1;
            #define ERROR_CHECK_MISSING_PARAM if (curr == NULL) return -2;

			inv->throttle_input = strtof(curr+sizeof("S="), &curr);
            
            curr = strstr(curr,"a=") != NULL ? strstr(curr,"a=") : strstr(curr,"A=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM  
			inv->aux_input = strtof(curr+sizeof("a="), &curr);
            
            curr = strstr(curr,"PWM=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->pwm = strtol(curr+sizeof("PWM="), &curr, 10);
            
            curr = strstr(curr,"U=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->voltage = strtof(curr+sizeof("U="), &curr);
            
            curr = strstr(curr,"I=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->phase_current = strtof(curr+sizeof("I="), &curr);
            
            curr = strstr(curr,"RPM=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->rpm = strtol(curr+sizeof("RPM="), &curr, 10);
            
            curr = strstr(curr,"con=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
			inv->power_stage_temp = strtol(curr+sizeof("con="), &curr, 10);
            
            curr = strstr(curr,"mot=");
			ERROR_CHECK_BUF_OVERFLOW
            ERROR_CHECK_MISSING_PARAM
            inv->motor_temp = strtol(curr+sizeof("mot="), &curr, 10);
            
			#undef ERROR_CHECK_BUF_OVERFLOW
            #undef ERROR_CHECK_MISSING_PARAM
            
            //for debugging
            
			SYS_CONSOLE_PRINT("Throttle Input: %f\n\r", inv->throttle_input);
			SYS_CONSOLE_PRINT("Aux Input: %f\n\r", inv->aux_input);
			SYS_CONSOLE_PRINT("PWM: %d\n\r", inv->pwm);
			SYS_CONSOLE_PRINT("Voltage: %f\n\r", inv->voltage);
            SYS_CONSOLE_PRINT("Current: %f\n\r", inv->phase_current);
            SYS_CONSOLE_PRINT("RPM: %d\n\r", inv->rpm);
			SYS_CONSOLE_PRINT("mot: %d\n\r", inv->motor_temp);	
	}
    return 0;
}
//=========================LOCAL FUNCTIONS

uint16_t get_inv_lowest_voltage(void)
{
	if( inv1.voltage < inv2.voltage) return inv1.voltage;
	else return inv2.voltage;
}



// This function takes an integer between 0 and 100, fills a buffer with a 
// Plettenberg motor command, and returns the length of the command
int get_thr_cmd(int desired_thr, char output[], size_t size)
{
    desired_thr = desired_thr/5; //for low-speed workshop testing
    
    char* ptr = output;
    
    if(desired_thr > 100) desired_thr = 100;
    if(desired_thr == 100){
        ptr += snprintf(ptr,3,"mr");
        return 2;
    }
	if(desired_thr < THR_DEADZONE){// if throttle is 0 or lower, stop the car
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
		
		return length;
	}
}

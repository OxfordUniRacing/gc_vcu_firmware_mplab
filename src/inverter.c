//===============================INCLUDES
#include "inverter.h"
#include "user.h"
#include "app.h"

//==========================DEFINITIONS

//==========================GLOBAL VAR
inv_t inv1;
inv_t inv2;
//==========================LOCAL VAR

//==========================LOCAL FUN DECLARATIONS

int get_thr_cmd(int desired_thr, char output[], size_t size);
void send_uart(int pedal_val);

//=========================GLOBAL FUNCTIONS
void update_inverter_current_limit(void)
{
	char* temp_str0 = "a";
	char* temp_str1 = "cl010";
	
	/* 
	 acl020er
	 */

	char* temp_str2 = "er";
//	
//	UART1_Write(temp_str0, sizeof(temp_str0));
//	UART1_Write(temp_str1, sizeof(temp_str1));
//	UART1_Write(temp_str2, sizeof(temp_str2));
//	
//	UART2_Write(temp_str0, sizeof(temp_str0));
//	UART2_Write(temp_str1, sizeof(temp_str1));
//	UART2_Write(temp_str2, sizeof(temp_str2));
	
	//SYS_CONSOLE_PRINT("RESET\n\r");
}

void handle_inverter(void)
{
	if(car_control.ready_to_drive == false)
	{
		
	}
	else
	{
		
	}
}

void inv_parse_rx(volatile char* msg, volatile size_t len, inv_t* inv, size_t (*io_write)(uint8_t*,const size_t) ) // @@ Check if we can read the inverter stuff for reading the voltage
{
	// IO DESCRIPTOR ARG Is for writing the s
	
	// Startup check - when the inverters start they send a menu with a * character which we should ignore, 
	// Therefore, only do the rest of the code (pare into the struct) when st_c = 0;
	int st_c = 1;
	
    SYS_CONSOLE_PRINT("INC: %s",msg);   //Print the message to the console
	
	// Check for garbage
	switch(msg[0])
	{
		case '*': // garbled start up message
			st_c = 1;
			break;
		case 'T': // big letter active - we want to change but maybe we cant @@ as a future safety thing, may want to turn off inverter, send lowercase s and then turn on
			st_c = 0;
			break;
		case 'S':
			st_c = 0;
			break;
		case 't': // inactive analogue
			// Change to 's'
			st_c = 0;
			io_write("s\r\n",4); // length including null terminator 
			break; 
		case 's':
			st_c = 0;
			break;
		default:
			return; // not any of those values so return (bad message!!!) 
	}

	
	if (st_c == 0) //  if its not start up noise, do the good shit
	{
		char* curr = (char*) msg;
		
			// Get the message and put in struct
			#define ERROR_CHECK if ((uintptr_t)curr > (uintptr_t)msg+len) goto error;
			inv->throttle_input = strtof(curr+2, &curr); // starts at curr 2 however many digits it taks to complete it it will increm cur pointer
			ERROR_CHECK
			inv->aux_input = strtof(curr+4, &curr); // check what string to long returns if garbled // check garbled maybe???
			ERROR_CHECK
			inv->pwm = strtol(curr+6, &curr, 10);
			ERROR_CHECK
			inv->voltage = strtof(curr+3, &curr);
			ERROR_CHECK
			inv->phase_current = strtof(curr+4, &curr);
			ERROR_CHECK
			inv->rpm = strtol(curr+6, &curr, 10);
			ERROR_CHECK
			inv->power_stage_temp = strtol(curr+5, &curr, 10);
			ERROR_CHECK
			inv->motor_temp = strtol(curr+7, &curr, 10); // debugged to +7
			ERROR_CHECK
			#undef ERROR_CHECK
			// @@@@ NOTE: when testing in C ide, the compiler does not recognize the degree character
		
			//SYS_CONSOLE_PRINT("Throttle Input: %f\n\r", inv->throttle_input);
			//SYS_CONSOLE_PRINT("Aux Input: %f\n\r", inv->aux_input);
			//SYS_CONSOLE_PRINT("PWM: %f\n\r", inv->pwm);
			//SYS_CONSOLE_PRINT("Voltage: %f\n\r", inv->voltage);
			//SYS_CONSOLE_PRINT("mot: %f\n\r", inv->motor_temp);
			
			
			return;	
			
			
			error:
			//log_warn("mc_parser: read beyond the end of the string!!!");
			return;
	}
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
    char* ptr = output;
    
    if(desired_thr > 100) desired_thr = 100;	// caps throttle at 99.9, cause why not
    if(desired_thr == 100){
        ptr += snprintf(output,2,"m");
        return 1;
    }
	if(desired_thr < 5){// if throttle is 0 or lower, stop the car
		ptr += snprintf(output,2,"0");
		return 1;
	}
	
	int length = 0;
	//decide first char: '1' - '9'
	int firstdec = (int)(desired_thr / 10);
	if(firstdec > 0){		// if 10.0% <= desired_thr <= 99.9%
		//output->buf[0] = '0' + firstdec;
        ptr += snprintf(output,1,"%d",firstdec);
		desired_thr -= 10 * firstdec;
		length += 1;
		
		// decide number of '+'
		int seconddec = (int)(desired_thr);
		for(int i = length; i < length+seconddec; i++)
		{
			//output->buf[i] = '+';
            ptr += snprintf(ptr,2,"+");
		}
		desired_thr -= seconddec;
		length += seconddec;
		
        return length;
	}
    else
	{							// if 0.1% <= desired_thr <= 9.9%
		//first letter must be '1'
		//output->buf[0] = '1';
        ptr += snprintf(output,2,"1");
		length += 1;
		
		// decide number of '+'
		int seconddec = (int)desired_thr;
		for(int i = length; i < length + (10-seconddec); i++){
			//output->buf[i] = '-';
            ptr += snprintf(ptr,2,"-");
		}
		desired_thr -= seconddec;
		length += (10-seconddec);
		
		return length;
	}
	
}


void send_uart(int pedal_val)
{
    //start with empty buffer long enough for any command
    char thr_cmd[128] = {0};
    //use helper function to fill buffer, actual length of command returned from
    //helper function so that I don't write unnecessary characters
    int length = get_thr_cmd(pedal_val,thr_cmd,128);
    //write same command to both motors
    UART1_Write((uint8_t*)thr_cmd,length);
    UART2_Write((uint8_t*)thr_cmd,length);
}


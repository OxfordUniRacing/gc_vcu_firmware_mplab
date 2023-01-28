//===============================INCLUDES
#include "inverter.h"
#include "user.h"

//==========================DEFINITIONS

//==========================GLOBAL VAR
inv_t inv1;
inv_t inv2;
//==========================LOCAL VAR

//==========================LOCAL FUN DECLARATIONS

uint16_t get_inv_lowest_voltage(void);

//=========================GLOBAL FUNCTIONS
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
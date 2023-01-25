/*******************************************************************************
* Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "app.h"
#include "configuration.h"
#include "system/debug/sys_debug.h"
#include "user.h"


// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

//============================UART=============================================
static volatile bool uart1_ready;
static volatile bool uart2_ready;

static volatile char inv1_rx_buf[128];
static volatile uint8_t inv1_rx_ptr = 0;
static volatile char inv2_rx_buf[128];
static volatile uint8_t inv2_rx_ptr = 0;

static volatile void uart1_rx_char(void)
{
    uint8_t temp_char;
    
    //Read through all characters in buffers from the uart and add them to a new buffer
    while(UART1_Read(&temp_char, 1))
    {
        //inv1_rx_time = current_time_ms(); //Sets the last time something was recieved for timeouts
        
        inv1_rx_buf[inv1_rx_ptr] = temp_char;                       //Set next location to the inputted character
        if(inv1_rx_ptr + 1 < sizeof(inv1_rx_buf)) inv1_rx_ptr++;    //Increment the pointer, overlapping if overflows
		else inv1_rx_ptr = 0;
		
        //If we recieve '\n', then the main line code is ready to read the buffers
		if(temp_char == '\n') // the end termination character is newline not /0 like we thought hahaha im in pain
		{
			uart1_ready = true;
			inv1_rx_buf[inv1_rx_ptr] = '\0';
		}
    }
}

static void uart1_rx_interrupt_handler(UART_EVENT event, uintptr_t context)
{
    switch(event)
    {
        case UART_EVENT_READ_THRESHOLD_REACHED: //If we have reached our threshold (of 1 byte))
            uart1_rx_char();
            break;
            
        case UART_EVENT_READ_BUFFER_FULL:   //If the read buffer is full
			uart1_rx_char();
            //Should never happen
            break;
            
        case UART_EVENT_READ_ERROR:     //If there is a reading errror
            //Probably should have something here to reset the module
            break;
            
        case UART_EVENT_WRITE_THRESHOLD_REACHED:    //If the number of write free spaces reaches the theshold
            //Dont think we need this one
            break;
    }    
}


static void uart2_rx_char(void)
{
    uint8_t temp_char;
    
    //Read through all characters in buffers from the uart and add them to a new buffer
    while(UART2_Read(&temp_char, 1))
    {
        //inv1_rx_time = current_time_ms(); //Sets the last time something was recieved for timeouts
        
        inv2_rx_buf[inv2_rx_ptr] = temp_char;                       //Set next location to the inputted character
        if(inv2_rx_ptr + 1 < sizeof(inv2_rx_buf)) inv2_rx_ptr++;    //Increment the pointer, overlapping if overflows
		else inv2_rx_ptr = 0;
		
        //If we recieve '\n', then the main line code is ready to read the buffers
		if(temp_char == '\n') // the end termination character is newline not /0 like we thought hahaha im in pain
		{
			uart2_ready = true;
			inv2_rx_buf[inv2_rx_ptr] = '\0';
			
		}
    }
}

static void uart2_rx_interrupt_handler(UART_EVENT event, uintptr_t context)
{
    switch(event)
    {
        case UART_EVENT_READ_THRESHOLD_REACHED: //If we have reached our threshold (of 1 byte))
            uart2_rx_char();
            break;
            
        case UART_EVENT_READ_BUFFER_FULL:   //If the read buffer is full
			uart2_rx_char();
            //Should never happen
            break;
            
        case UART_EVENT_READ_ERROR:     //If there is a reading errror
            //Probably should have something here to reset the module
            break;
            
        case UART_EVENT_WRITE_THRESHOLD_REACHED:    //If the number of write free spaces reaches the theshold
            //Dont think we need this one
            break;
    }    
}


//==================================INVERTERS===================================
// Motor stream is the uart recive buffer
//State of Motor Controller as given from the plettenberg manual (this is the info we are getting from the MCs)
typedef struct {
	char inputmethod;
	float aux_input;
	float throttle_input;
	int pwm;
	float voltage;
	float phase_current;
	int rpm;
	int power_stage_temp;
	int motor_temp; // this is the one we want for dash display (to be sent across can)
	
}inv_t;

static inv_t inv1;
static inv_t inv2;

uint16_t get_inv_lowest_voltage(void)
{
	if( inv1.voltage < inv2.voltage) return inv1.voltage;
	else return inv2.voltage;
}
/*
 * XC32 kicking off warnings about passing a function with argument uint8_t* vs const char* - shouldn't make a difference but maybe look at different 
 */
static void inv_parse_rx(volatile char* msg, volatile size_t len, inv_t* inv, size_t (*io_write)(uint8_t*,const size_t) ) // @@ Check if we can read the inverter stuff for reading the voltage
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
		
			SYS_CONSOLE_PRINT("Throttle Input: %f\n\r", inv->throttle_input);
			SYS_CONSOLE_PRINT("Aux Input: %f\n\r", inv->aux_input);
			SYS_CONSOLE_PRINT("PWM: %f\n\r", inv->pwm);
			SYS_CONSOLE_PRINT("Voltage: %f\n\r", inv->voltage);
			SYS_CONSOLE_PRINT("mot: %f\n\r", inv->motor_temp);
			
			
			return;	
			
			
			error:
			//log_warn("mc_parser: read beyond the end of the string!!!");
			return;
	}
}

void handle_uart(void)
{
	uart2_rx_char();	//Interrupts not working, so just poll the rx
	uart1_rx_char();
	
    if(uart1_ready)	//If the uart 1 interrupt has been called
	{
		inv_parse_rx(inv1_rx_buf, inv1_rx_ptr, &inv1, &UART1_Write);   
		inv1_rx_ptr = 0;
		uart1_ready = false;
	}
	if(uart2_ready)
	{
		inv_parse_rx(inv2_rx_buf, inv2_rx_ptr, &inv2, &UART2_Write);
		inv2_rx_ptr = 0;
		uart2_ready = false;
	}
}


void APP_Initialize ( void )
{   
    UART1_ReadThresholdSet(1);      //Allow for interrupt to be called when 1 byte is received
    UART1_ReadCallbackRegister(uart1_rx_interrupt_handler, (uintptr_t)NULL);   //Set the callback function to our custom function
         
    UART2_ReadThresholdSet(1);      //Allow for interrupt to be called when 1 byte is received
    UART2_ReadCallbackRegister(uart2_rx_interrupt_handler, (uintptr_t)NULL);   //Set the callback function to our custom function
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */
void APP_Tasks ( void )
{
    handle_uart();
	
	
	
//	char* test_msg_1 = "This is testing UART1\";
//	char* test_msg_2 = "This is testing UART2\";
//	
//    UART1_write(test_msg_1, sizeof(test_msg_1));
//	UART2_write(test_msg_1, sizeof(test_msg_1));
	
    //Just for testing add an echo for the console
    static char console_rx_buf[10];
    
    if (SYS_CONSOLE_Read(0, console_rx_buf, 1) >= 1)
    {
	    LED_TOGGLE();
		SYS_CONSOLE_PRINT("%c", console_rx_buf[0]);
		UART2_Write(console_rx_buf, 1);
    }
}
/*******************************************************************************
 End of File
 */

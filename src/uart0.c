//=====================INCLUDES
#include <xc.h>
#include <stdio.h>

#include "peripheral/uart/plib_uart_common.h"
#include "peripheral/uart/plib_uart1.h"
#include "peripheral/uart/plib_uart2.h"
#include "inverter.h"
#include "user.h"
#include "timer.h"
//=====================DEFINITIONS

//=====================================GLOBAL VARIABLES========================

//=====================================LOCAL VARIABLES=========================

static volatile bool uart1_ready;
static volatile bool uart2_ready;

static volatile char inv1_rx_buf[128];
static volatile uint8_t inv1_rx_ptr = 0;
static volatile char inv2_rx_buf[128];
static volatile uint8_t inv2_rx_ptr = 0;

//================================LOCAL FUNCTION DECLARATIONS===================
static volatile void uart1_rx_char(void);
static void uart1_rx_interrupt_handler(UART_EVENT event, uintptr_t context);
static void uart2_rx_char(void);
static void uart2_rx_interrupt_handler(UART_EVENT event, uintptr_t context);
//=================================GLOBAL FUNCTIONS=============================

void init_uart(void)
{
	//SETUP UART
    UART1_ReadThresholdSet(1);      //Allow for interrupt to be called when 1 byte is received
    UART1_ReadCallbackRegister(uart1_rx_interrupt_handler, (uintptr_t)NULL);   //Set the callback function to our custom function
         
    UART2_ReadThresholdSet(1);      //Allow for interrupt to be called when 1 byte is received
    UART2_ReadCallbackRegister(uart2_rx_interrupt_handler, (uintptr_t)NULL);   //Set the callback function to our custom function
	
}

void handle_uart(void)
{
	uart2_rx_char();	//Interrupts not working, so just poll the rx
	uart1_rx_char();
	
    if(uart1_ready)	//If the uart 1 interrupt has been called
	{
		comms_time.inv1 = current_time_ms();
        inv_parse_rx(inv1_rx_buf, inv1_rx_ptr, &inv1, &UART1_Write); 
		inv1_rx_ptr = 0;
		uart1_ready = false;
	}
	if(uart2_ready)
	{
		comms_time.inv2 = current_time_ms();
        inv_parse_rx(inv2_rx_buf, inv2_rx_ptr, &inv2, &UART2_Write);
		inv2_rx_ptr = 0;
		uart2_ready = false;
	}
}

// This function takes an integer between 0 and 100, fills a buffer with a 
// Plettenberg motor command, and returns the length of the command
int get_thr_cmd(int desired_thr, char output[], size_t size){
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
		for(int i = length; i < length+seconddec; i++){
			//output->buf[i] = '+';
            ptr += snprintf(ptr,2,"+");
		}
		desired_thr -= seconddec;
		length += seconddec;
		
        return length;
	}
    else{							// if 0.1% <= desired_thr <= 9.9%
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

void send_uart(int pedal_val){
    //start with empty buffer long enough for any command
    char thr_cmd[128] = {0};
    //use helper function to fill buffer, actual length of command returned from
    //helper function so that I don't write unnecessary characters
    int length = get_thr_cmd(pedal_val,thr_cmd,128);
    //write same command to both motors
    UART1_Write((uint8_t*)thr_cmd,length);
    UART2_Write((uint8_t*)thr_cmd,length);
}


//=================================LOCAL FUNCTIONS==============================


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
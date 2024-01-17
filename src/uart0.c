//=====================INCLUDES
#include <xc.h>
#include <stdio.h>
#include <string.h>

#include "peripheral/uart/plib_uart_common.h"
#include "peripheral/uart/plib_uart1.h"
#include "peripheral/uart/plib_uart2.h"
#include "inverter.h"
#include "precharge.h" //for breaking the ass loop
#include "user.h"
#include "timer.h"
#include "car_control.h"
#include "pio.h"
#include "globals.h"
//=====================DEFINITIONS

//=====================================GLOBAL VARIABLES========================

//=====================================LOCAL VARIABLES=========================

static volatile bool uart1_ready;
static volatile bool uart2_ready;
static volatile bool uart1_rdNotificationEnabled = false;
static volatile bool uart2_rdNotificationEnabled = false;

static volatile char inv1_rx_buf[600];
static volatile uint16_t inv1_rx_ptr = 0;
static volatile char inv2_rx_buf[600];
static volatile uint16_t inv2_rx_ptr = 0;

//================================LOCAL FUNCTION DECLARATIONS===================
static void uart1_rx_char(void);
static void uart1_rx_char_startup(void);
static void uart1_rx_interrupt_handler(UART_EVENT event, uintptr_t context);
static void uart2_rx_char(void);
static void uart2_rx_char_startup(void);
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
	/*if(tx_ready.dcl_inv1){
        tx_time.dcl_inv1 = current_time_ms();
        UART1_Write("sa",2);
        UART1_Write("il200",5);
        UART1_Write("wp",2);
    }
    
    if(tx_ready.dcl_inv2){
        tx_time.dcl_inv2 = current_time_ms();
        UART2_Write("sa",2);
        UART2_Write("il200",5);
        UART2_Write("wp",2);
    }*/
    
    /* The below if-else structure is a workaround for poorly behaved startup
     messages. The messages that the inverters send on startup have many
     new-line characters in them. If these are set all at once, the uart
     interrupts catch them all and feed them all to our parser. Our parser
     sees all these messages, tries to split up our program's buffer, and
     promptly breaks. The solution is to wait for the car to be in
     ready-to-drive mode, at which point there is only one new-line per message.
     So, if the car isn't in ready-to-drive mode, we read characters by polling
     the rx line and we disable read notifications, thus disabling interrupts.
     If the car is in ready-to-drive mode, we enable read notifications and
     let interrupts take care of things for us. Note that we only enable or
     disable interrupts once per state change - spamming changing this flag
     causes bad behavior.*/
	
#ifndef DEBUG_IGNORE_BMS
    if(!car_control.ignition){
        char temp_char;
        while(UART1_Read(&temp_char,1));
        while(UART2_Read(&temp_char,1));
    }
#endif
	
    if(!(car_control.precharge_ready && car_control.inverter_params_complete)){
        if(!comms_active.inv1)
            uart1_rx_char();
        else
            uart1_rx_char();
        if(!comms_active.inv2)
            uart2_rx_char();
        else
            uart2_rx_char();
        if(uart1_rdNotificationEnabled) {
            UART1_ReadNotificationEnable(false,false);
            uart1_rdNotificationEnabled = false;
        }
        if(uart2_rdNotificationEnabled) { 
            UART2_ReadNotificationEnable(false,false);
            uart2_rdNotificationEnabled = false;
        }
    }
    else{
        if(!uart1_rdNotificationEnabled) {
            UART1_ReadNotificationEnable(true,true);
            uart1_rdNotificationEnabled = true;
        }
        if(!uart2_rdNotificationEnabled) { 
            UART2_ReadNotificationEnable(true,true);
            uart2_rdNotificationEnabled = true;
        }
    }
	
	if(uart2_ready)
	{
        int error_code = inv_parse_rx(inv2_rx_buf, inv2_rx_ptr, &inv2, &UART2_Write);
        
        if(error_code == 0){ //successful inverter read, send a pedal command
            comms_time.inv2 = current_time_ms();
            
            if(car_control.ready_to_drive){
                int cmd_val = get_inv2_cmd();
                char thr_cmd[128] = {0};
                int length = get_thr_cmd_str(cmd_val,thr_cmd,128);
                UART2_Write((uint8_t*)thr_cmd,length);
                inv2.active_drive = cmd_val > 0;
            }
        }
        else if(error_code > 0){ //the inverters have thrown an error code, which means the ass loop needs to be broken immediately
            ass.break_loop_inverter_error = true;
        }
        else{
            SYS_CONSOLE_PRINT("Non-critical error code from inverter 2: %d\n\r",error_code);
            /* This will print -1 if the parse function tried to read past the
             length of the inverter buffer, and will print -2 if the parse
             function encountered some other problem e.g. an unexpected message.
             Either way, this else statement deliberately does not update
             comms_time so that if this condition persists, a timeout occurs*/
#ifdef DEBUG_PRINT_INVERTER_MESSAGES
			SYS_CONSOLE_PRINT("INV2: %s\n\r", inv2_rx_buf);
#endif
        }
		inv2_rx_ptr = 0;
		uart2_ready = false;
	}
	
    if(uart1_ready)	//If the uart 1 interrupt has been called
	{
        int error_code = inv_parse_rx(inv1_rx_buf, inv1_rx_ptr, &inv1, &UART1_Write);
        
        if(error_code == 0){ //successful inverter read, send a pedal command
            comms_time.inv1 = current_time_ms();
            
            if(car_control.ready_to_drive){
                int cmd_val = get_inv1_cmd();
                char thr_cmd[128] = {0};
                int length = get_thr_cmd_str(cmd_val,thr_cmd,128);
                UART1_Write((uint8_t*)thr_cmd,length);
                inv1.active_drive = cmd_val > 0;
            }
        }
        else if(error_code > 0){ //the inverters have thrown an error code, which means the ass loop needs to be broken immediately
            ass.break_loop_inverter_error = true;
        }
        else{
            SYS_CONSOLE_PRINT("Non-critical error code from inverter 1: %d\n\r",error_code);
			
#ifdef DEBUG_PRINT_INVERTER_MESSAGES
			SYS_CONSOLE_PRINT("INV1: %s\n\r", inv1_rx_buf);
#endif
            /* This will print -1 if the parse function tried to read past the
             length of the inverter buffer, and will print -2 if the parse
             function encountered some other problem e.g. an unexpected message.
             Either way, this else statement deliberately does not update
             comms_time so that if this condition persists, a timeout occurs*/
        }
		inv1_rx_ptr = 0;
		uart1_ready = false;
	}
    
    
}




//=================================LOCAL FUNCTIONS==============================
static void uart1_rx_char_startup(void){
    uint8_t temp_char;
    
    //Read through all characters in buffers from the uart and add them to a new buffer
    while(UART1_Read(&temp_char, 1))
    {
        if(inv1_rx_ptr == sizeof(inv1_rx_buf)) inv1_rx_ptr = 0;
        //inv1_rx_time = current_time_ms(); //Sets the last time something was recieved for timeouts
        //SYS_CONSOLE_PRINT("%c",temp_char);
        inv1_rx_buf[inv1_rx_ptr] = temp_char;                       //Set next location to the inputted character
        if(inv1_rx_ptr < sizeof(inv1_rx_buf)) inv1_rx_ptr++;    //Increment the pointer, overlapping if overflows
		if(inv1_rx_ptr == sizeof(inv1_rx_buf)){ 
            uart1_ready = true;
        }
        
        /*if(inv1_rx_ptr%695 == 0) // the end termination character is newline not /0 like we thought hahaha im in pain
		{
			uart1_ready = true;
			inv1_rx_buf[inv1_rx_ptr] = '\0';
		}*/
    }
}

static void uart1_rx_char(void){
    uint8_t temp_char;
    
    //Read through all characters in buffers from the uart and add them to a new buffer
    while(UART1_Read(&temp_char, 1))
    {
        //inv1_rx_time = current_time_ms(); //Sets the last time something was recieved for timeouts
        //SYS_CONSOLE_PRINT("%c",temp_char);
        inv1_rx_buf[inv1_rx_ptr] = temp_char;                       //Set next location to the inputted character
        if(inv1_rx_ptr + 1 < sizeof(inv1_rx_buf)) inv1_rx_ptr++;    //Increment the pointer, overlapping if overflows
		else inv1_rx_ptr = 0;
        
        if(temp_char == '\n') // the end termination character is newline not /0 like we thought hahaha im in pain
		{
			uart1_ready = true;
			inv1_rx_buf[inv1_rx_ptr] = '\0';
		}
    }
}

static void uart2_rx_char_startup(void)
{
    
    uint8_t temp_char;
    
    //Read through all characters in buffers from the uart and add them to a new buffer
    while(UART2_Read(&temp_char, 1))
    {
        if(inv2_rx_ptr == sizeof(inv2_rx_buf)) inv2_rx_ptr = 0;
        //inv1_rx_time = current_time_ms(); //Sets the last time something was recieved for timeouts
        //SYS_CONSOLE_PRINT("%c",temp_char);
        inv2_rx_buf[inv2_rx_ptr] = temp_char;                       //Set next location to the inputted character
        if(inv2_rx_ptr < sizeof(inv2_rx_buf)) inv2_rx_ptr++;    //Increment the pointer, overlapping if overflows
		if(inv2_rx_ptr == sizeof(inv2_rx_buf)){ 
            uart2_ready = true;
        }
        //If we recieve '\n', then the main line code is ready to read the buffers. This only works because WE don't send \n
		/*if(inv2_rx_ptr%700 == 0) // the end termination character is newline not /0 like we thought hahaha im in pain
		{
			uart2_ready = true;
			inv2_rx_buf[inv2_rx_ptr] = '\0';
		}*/
    }
}

/* The interrupt makes use of three cases.
    Case 1: UART_EVENT_READ_THRESHOLD_REACHED
    This happens when the uart line sees at least one unread byte. When this
    occurs, the function UART1_Peek is used to look at the last unread character
    in the buffer. It was found that if uart1_rx_char is called on every read
    threshold interrupt, characters could be skipped by uart1_rx_char. If
    we use UART1_Peek to search for \n, a character that appears once at the end
    of every message, then uart1_rx_char only gets called once per message
    and we're good to go. 
    
    Case 2: UART_EVENT_READ_BUFFER_FULL
    This only happens when the code isn't working.
 
    Case 3: UART_EVENT_READ_ERROR
    This occurs whenever the inverters startup or shutdown. The error does not
    persist once the inverters have carried on communicating, however interrupts
    won't work anymore unless the error is cleared. UART1_ErrorGet() clears the
    error. */
static void uart1_rx_interrupt_handler(UART_EVENT event, uintptr_t context)
{   
    uint8_t temp_char = ' ';
    switch(event)
    {
        case UART_EVENT_READ_THRESHOLD_REACHED: //If we have reached our threshold (of 1 byte))
            UART1_Peek(&temp_char);
            if(temp_char == '\n'){
                uart1_rx_char();
            }
            break;
            
        case UART_EVENT_READ_BUFFER_FULL:   //If the read buffer is full
			SYS_CONSOLE_PRINT("uart1 Buffer full\n\r");
            uart1_rx_char();
            //Should never happen
            break;
            
        case UART_EVENT_READ_ERROR:     //If there is a reading errror
            UART1_ErrorGet();
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
        //SYS_CONSOLE_PRINT("%c",temp_char);
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
    uint8_t temp_char = ' ';
    switch(event)
    {
        case UART_EVENT_READ_THRESHOLD_REACHED: //If we have reached our threshold (of 1 byte))
            UART2_Peek(&temp_char);
            if(temp_char == '\n'){
                uart2_rx_char();
            }
            break;
            
        case UART_EVENT_READ_BUFFER_FULL:   //If the read buffer is full
			SYS_CONSOLE_PRINT("uart2 Buffer full\n\r");
            uart2_rx_char();
            //Should never happen
            break;
            
        case UART_EVENT_READ_ERROR:     //If there is a reading errror
            UART2_ErrorGet();
            break;
            
        case UART_EVENT_WRITE_THRESHOLD_REACHED:    //If the number of write free spaces reaches the theshold
            //Dont think we need this one
            break;
    }
}
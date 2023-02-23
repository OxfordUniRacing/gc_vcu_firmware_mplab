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

#include "user.h"

#include "timer.h"
#include "uart0.h"
#include "can.h"
#include "pio.h"
#include "inverter.h"
#include "precharge.h"


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
control_t car_control = {0};
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
//==================================INVERTERS===================================
// Motor stream is the uart recive buffer
//State of Motor Controller as given from the plettenberg manual (this is the info we are getting from the MCs)

/*
 * XC32 kicking off warnings about passing a function with argument uint8_t* vs const char* - shouldn't make a difference but maybe look at different 
 */


void handle_console(void)
{
	static uint8_t console_rx_buf[10];
    
    if (SYS_CONSOLE_Read(0, console_rx_buf, 1) >= 1)
    {
	    LED_TOGGLE();
		SYS_CONSOLE_PRINT("%c", console_rx_buf[0]);
		UART2_Write(console_rx_buf, 1);
		UART1_Write(console_rx_buf, 1);
    }
}


void APP_Initialize ( void )
{   
	//SETUP Uart
	init_uart();
	
	//Timer
	init_timer();
	
	//init can
    
	init_can();
    
    init_pio();
	
	SYS_CONSOLE_PRINT("\n\r============SYSTEM ON==========\n\r");

}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    handle_tx_timer();
    handle_precharge();
    handle_pio();
    
    handle_uart();
	
	handle_console();
	
	handle_can();
	
    /*if(pedal_val != -1){
        send_uart(pedal_val);
    }*/
    
	static uint32_t update_time = 0;
	if(has_delay_passed(update_time, 10000))
	{
		update_time = current_time_ms();
		update_inverter_current_limit();
	}
	
    handle_timeouts();
}

//=================================PRECHARGE==========================================


/*******************************************************************************
 End of File
 */

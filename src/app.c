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
#include "car_control.h"


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
    //@@ Try using interrupts with read notifications enabled
	
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
    handle_can();
    handle_pio();
    handle_precharge();
    
    //handle_uart();
	
	handle_console();
	handle_inverters();
    handle_timeouts();
	
	
	
	static uint32_t send_debug_timer = 0;
    if(current_time_ms() - send_debug_timer > 1000){
        //SYS_CONSOLE_PRINT("TS active: %d\n\r",ts_active());
        //SYS_CONSOLE_PRINT("ASS flags: %d\n\r%d\n\r%d\n\r%d\n\r%d\n\r",ass.break_loop_inverter_error,ass.break_loop_precharge,ass.break_loop_ts_deactive,ass.break_loop_timeout,ass.break_loop_pedal_invalid);
        //SYS_CONSOLE_PRINT("BMS Voltage: %f\n\r",bms.voltage);
		SYS_CONSOLE_PRINT("Inverter Voltage: %f\n\r", get_inv_lowest_voltage() );
        //SYS_CONSOLE_PRINT("Car control RTD: %d\n\r",car_control.ready_to_drive);
        //SYS_CONSOLE_PRINT("Steering sensor value: %f\n\r",car_control.user_steering_value);
		//SYS_CONSOLE_PRINT("PEDAL: %d\n\r", car_control.user_pedal_value);
		SYS_CONSOLE_PRINT("BRAKE: %d\n\r", car_control.brake_on);
        //SYS_CONSOLE_PRINT("RTD: %d\n\r",car_control.ready_to_drive);
		SYS_CONSOLE_PRINT("TS ACTIVE: %d\n\r", ts_active());
		SYS_CONSOLE_PRINT("BMS VOTLAGE: %f\n\r", bms.voltage);
		//SYS_CONSOLE_PRINT("AMS PRECHARGE EN: %d\n\r", bms.ams_precharge_enabled);
        SYS_CONSOLE_PRINT("Brake pressure reading: %f\n\r",car_control.brake_pressure);
        //SYS_CONSOLE_PRINT("bms.ams_precharge_enabled: %d\n\r",bms.ams_precharge_enabled);
        SYS_CONSOLE_PRINT("bms:%d\tdash:%d\tinv1:%d\tinv2:%d\tpb:%d\tsteer:%d\n\r",comms_active.bms,comms_active.dash,comms_active.inv1,comms_active.inv2,comms_active.pb,comms_active.steering);
        //SYS_CONSOLE_PRINT("Inverter 1 ID: %ld\n\r",inv1.id);
        //SYS_CONSOLE_PRINT("Inverter 2 ID: %ld\n\r",inv2.id);
		
		if(inv1.fault_active)
		{
			SYS_CONSOLE_PRINT("INV1 FAULT: %x", inv1.fault_code);
		}
		
		if(inv2.fault_active)
		{
			SYS_CONSOLE_PRINT("INV2 FAULT: %x", inv2.fault_code);
		}
		
		
		static uint32_t id = 1;
		uint8_t data[8] = {1,2,3,4,5,6,7,8};
		uint8_t len = 8;
		
		//send_can_message(id, data, len);
		
		id++;
		
        send_debug_timer = current_time_ms();
    }
}

//=================================PRECHARGE==========================================


/*******************************************************************************
 End of File
 */

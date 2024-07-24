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

//How often we send messages to the inverter (ms))
#define HC1_DRIVE_PERIOD		100
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
	
	if(car_control.inverters_enable)
	{
		if( has_delay_passed(HC1_transmit_time, HC1_DRIVE_PERIOD))
		{
			update_HC1_drive();
			
			HC1_transmit_time = current_time_ms();
		}
	}
	else if(car_control.inverters_energise)
	{
		if( has_delay_passed(HC1_transmit_time, HC1_DRIVE_PERIOD))
		{
			update_HC1_energise();
			
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
	
	if( has_delay_passed(HC3_transmit_time, HC3_PERIOD))
	{
		update_HC3();

		HC3_transmit_time = current_time_ms();
	}
	
	

	//If comms have broken to the inverters, set the voltage to default (0))
    if(!comms_active.inv1){
        inv1.capacitor_voltage = 0;
    }
    
    if(!comms_active.inv2){
        inv2.capacitor_voltage = 0;
    }
	
	//If any inverters report a fault, stop the car.
	
	inv1.fault_active = (inv1.statusword == 0x0B);
	
	inv2.fault_active = (inv2.statusword == 0x0B);

	
}


float get_inv_lowest_voltage(void)
{
	if( inv1.capacitor_voltage < inv2.capacitor_voltage) return inv1.capacitor_voltage;
	else return inv2.capacitor_voltage;
}


//=========================LOCAL FUNCTIONS======================================
//=============================INCLUDES
#include <xc.h>
#include <stdbool.h>
#include "precharge.h"
#include "pio.h"
#include "user.h"
#include "timer.h"
#include "inverter.h"
#include "user.h"
#include "car_control.h"
#include "globals.h"

//==============================DEFINITIONS
#define WRITE_PARAMETERS    false

#define INVERTER_PRECHARGE_CURRENT		0.04
#define INVERTER_PRECHARGE_RESISTANCE	220

#define INVERTER_POSITIVE_SLEW_RATE_COMMAND     "ri"
#define INVERTER_NEGATIVE_SLEW_RATE_COMMAND     "rd"
#define INVERTER_RESPONSE_TIME_COMMAND          "ot"
#define INVERTER_CURRENT_LIMIT_COMMAND          "il"
#define INVERTER_PHASE_CURRENT_LIMIT_COMMAND    "cl"
#define INVERTER_POLE_PAIRS_COMMAND             "pp"
#define INVERTER_UNDERVOLTAGE_COMMAND                    "uv040"

//=============================GLOBAL VAR

bms_t bms = {
    .pack_dlc = 10, //minimum value we can set inverters to
    .precharge_enable = true,
    .voltage = 100
};
ass_t ass = {0};

//============================LOCAL VAR



static volatile uint32_t precharge_start_time = 0;
static volatile uint32_t parameter_write_start_time = 0;

//===================================LOCAL FUNC DECLARATIONS
static bool handle_inverter_parameters(void);

//===========================================GLOBAL FUNC

void handle_precharge(void)
{
	inv1.POSITIVE_SLEW_RATE = 200;
    inv1.NEGATIVE_SLEW_RATE = 400;
    inv1.RESPONSE_TIME = 50;
    inv1.POLE_PAIRS = 1;
    inv1.CURRENT_LIMIT = 150;
    
    inv2.POSITIVE_SLEW_RATE = 200;
    inv2.NEGATIVE_SLEW_RATE = 400;
    inv2.RESPONSE_TIME = 50;
    inv2.POLE_PAIRS = 1;
    inv2.CURRENT_LIMIT = 150;
    
    static enum {
		PC_TS_OFF,						//The TS is not active
        PC_BMS_RELAY,                   //For handling the BMS relay
		PC_WAIT_FOR_INVERTER,			//Waiting for communication from the inverters
		PC_WAIT_FOR_INVERTER_ENERGISE,	//Waiting fot the inverters to enter "energised" state
		PC_WAIT_FOR_INVERTER_ENABLED,	//Waiting for the inverters to enter "enabled" state
		PC_WAIT_FOR_FINAL_VOLTAGE,		//Waiting for the inverter voltage to reach 95% of battery voltage
		PC_WAIT_FOR_PRECHARGE_DISABLE,
		PC_READY,						//Ready to for BMS to exit precharge
		PC_FAILED						//A timeout has occured, set flag for VCU relay to open 
	} PRECHARGE_STATE = PC_TS_OFF;		//Different possible precharge states
    
    if(!car_control.ignition){
         //driver stopped the car safely, reset the precharge sequence
        if(PRECHARGE_STATE == PC_READY){         
            PRECHARGE_STATE = PC_TS_OFF;
            //UART1_Write("asd\n\r",5);
            //UART2_Write("asd\n\r",5);
        }
        //ts button state cycled during precharge process, probably safe to fail it
        else if(PRECHARGE_STATE != PC_TS_OFF){   
            PRECHARGE_STATE = PC_FAILED;
        }
    }
    
    if((bms.voltage < 75 || bms.voltage > 125) && ts_active() && !car_control.precharge_ready){
        PRECHARGE_STATE = PC_FAILED;
    }

	//=======================================================
	//HANDLE THE TS LATCHING OFF
	/*static bool old_ts;
	if(!car_control.ignition)
	{
		ass.break_loop_ts_deactive = false;
	}
	else if(PRECHARGE_STATE != PC_TS_OFF && PRECHARGE_STATE != PC_FAILED )	//If the ts is active, keep it active
	{
		ass.break_loop_ts_deactive = false;
		old_ts = false;
	}
	else							//If at any point the ts has been deactivated, then latch it off
	{
		ass.break_loop_ts_deactive = true;
		
		if(old_ts == false)
		{
			old_ts = true;
			SYS_CONSOLE_PRINT("TS DEACTIVE - EMSDC LATCHED\n\r");
			SYS_CONSOLE_PRINT("POWER CYCLE TO RESET\n\r");
			PRECHARGE_STATE = PC_FAILED;
		}
	}*/
	
	//=====================================================
	//Handles the precharge states
	switch(PRECHARGE_STATE)
	{
		case PC_TS_OFF:
			/*
			 * While waiting for the TS to turn on, ensure that our ASS relay is closed
			 * 
			 * Moved on when we detect the ts is active
			 */
			bms.precharge_enable = true;
            ass.break_loop_precharge = false;
			car_control.inverters_energise = false;
			car_control.inverters_enable = false;
            car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
            
			if(car_control.ignition)
			{
#ifdef DEBUG_IGNORE_BMS
				PRECHARGE_STATE = PC_WAIT_FOR_INVERTER;
#else
				PRECHARGE_STATE = PC_BMS_RELAY;
#endif
				precharge_start_time = current_time_ms();
                SYS_CONSOLE_PRINT("PC_TS_OFF_SUCCESS\n\r");
			}
			break;
           
        case PC_BMS_RELAY:
			/*
			 * Once the TS is active, start sending a command to the battery to enter precharge mode
			 * 
			 * Move on once the BMS has successfully entered precharge mode 
			 */
			bms.precharge_enable = true;
			ass.break_loop_precharge = false;
			car_control.inverters_energise = false;
			car_control.inverters_enable = false;
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
            
            //bms.ams_precharge_enabled included for clarity, but ts_active() will always imply bms.ams_precharge_enabled
            if(ts_active() && bms.ams_precharge_enabled)
			{
                PRECHARGE_STATE = PC_WAIT_FOR_INVERTER;
                SYS_CONSOLE_PRINT("PC_BMS_RELAY_SUCCESS\n\r");
            }
            if(has_delay_passed(precharge_start_time,2000))
			{
                PRECHARGE_STATE = PC_FAILED;
                SYS_CONSOLE_PRINT("PC_BMS_RELAY_FAIL\n\r");
            }
            break;
            
        case PC_WAIT_FOR_INVERTER:
			/*
			 * Once we have entered precharge mode, wait for both inverters to start communicating
			 * 
			 * Once inverters are commmunicating, move on
			 * 
			 * 
			 */
			bms.precharge_enable = true;
			ass.break_loop_precharge = false;
			car_control.inverters_energise = false;
			car_control.inverters_enable = false;
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
            
			if(inv1.statusword == STATUSWORD_SHUTDOWN && inv2.statusword == STATUSWORD_SHUTDOWN)
			{
				PRECHARGE_STATE = PC_WAIT_FOR_INVERTER_ENERGISE;
                SYS_CONSOLE_PRINT("PC_INVERTER_COMMS_SUCCESS\n\r");
			}
			else
			{
				//@@ Needs to calculate total delay
				//t = RC ln ( Vbat / (Vbat - 30*1.2) ) * 1000
                
				if(has_delay_passed(precharge_start_time, 3000))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_INVERTER_COMMS_FAIL\n\r");
				}
				//Checked we have received communication from inverter
				//else check how much time has passed
			}
			

			break;
			
		case PC_WAIT_FOR_INVERTER_ENERGISE:
			
			bms.precharge_enable = true;
			ass.break_loop_precharge = false;
			car_control.inverters_energise = true;		//Enabled 
			car_control.inverters_enable = false;
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
			if(inv1.statusword == STATUSWORD_ENERGISED && inv2.statusword == STATUSWORD_ENERGISED)
			{
				PRECHARGE_STATE = PC_WAIT_FOR_FINAL_VOLTAGE;
                SYS_CONSOLE_PRINT("PC_INVERTERS_ENERGISED_SUCCESS\n\r");
			}
			else
			{
	
				if(has_delay_passed(precharge_start_time, 3000))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_INVERTERS_ENERGISED_FAILED\n\r");
				}
			}
			
			
			break;
			
		
			
		case PC_WAIT_FOR_FINAL_VOLTAGE:
			/*
			 * Once inverters are communicating, wait until the inverters have reached 95% of the battery votlage
			 * 
			 * The inverters are being charged through a 220 ohm resistor, with approximately 40mA of current.
			 *	-> have to add on an additional 9 Volts when checking if we have reached the final voltage
			 * 
			 * After this, the car is ready to start
			 */
            
            /*if(inv1.id == strtol(INVERTER_RIGHT_ID,NULL,10) || inv2.id == strtol(INVERTER_LEFT_ID,NULL,10)){
                ass.break_loop_inverter_error = true;
                PRECHARGE_STATE = PC_FAILED;
            }*/
			
			bms.precharge_enable = true;
			ass.break_loop_precharge = false;
			car_control.inverters_energise = true;
			car_control.inverters_enable = false;
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
#ifdef DEBUG_IGNORE_BMS
			PRECHARGE_STATE = PC_READY;
#else
			
			if(		get_inv_lowest_voltage() > bms.voltage * 0.90)
			{
				PRECHARGE_STATE = PC_WAIT_FOR_PRECHARGE_DISABLE;
                SYS_CONSOLE_PRINT("PC_WAIT_FOR_FINAL_VOLTAGE_SUCCESS\n\r");
			}
			else
			{
				//t = 1000* -RCln(1-0.95) =1000* RCln20 = 3743
				if(has_delay_passed(precharge_start_time, 10000))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_WAIT_FOR_FINAL_VOLTAGE_FAIL\n\r");
				}
			}
#endif
			break;
			
		case PC_WAIT_FOR_PRECHARGE_DISABLE:
			bms.precharge_enable = false;
			ass.break_loop_precharge = false;
			car_control.inverters_energise = true;
			car_control.inverters_enable = false;	
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
			
			if(!bms.ams_precharge_enabled)
			{
				PRECHARGE_STATE = PC_WAIT_FOR_INVERTER_ENABLED;
				SYS_CONSOLE_PRINT("PC_WAIT_FOR_BMS_PRECHARGE_DISABLE_SUCCESS\n\r");
			}
			else
			{
				if(has_delay_passed(precharge_start_time, 10000))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_WAIT_FOR_BMS_PRECHARGE_DISABLE_FAILED\n\r");
				}
			}
			
			break;
            
		case PC_WAIT_FOR_INVERTER_ENABLED:
			
			bms.precharge_enable = false;
			ass.break_loop_precharge = false;
			car_control.inverters_energise = false;	//Disable
			car_control.inverters_enable = true;	//Enable
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
			if(inv1.statusword == STATUSWORD_ENABLED && inv2.statusword == STATUSWORD_ENABLED)
			{
				PRECHARGE_STATE = PC_READY;
                SYS_CONSOLE_PRINT("PC_INVERTERS_ENABLED_SUCCESS\n\r");
			}
			else
			{

                
				if(has_delay_passed(precharge_start_time, 10000))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_INVERTERS_ENABLED_FAILED\n\r");
				}

			}
			
			break;
			
		case PC_READY:
			bms.precharge_enable = false;
			ass.break_loop_precharge = false;
			car_control.inverters_energise = false;
			car_control.inverters_enable = true;
            car_control.precharge_ready = true;
            car_control.inverter_params_complete = true;
			break;
		case PC_FAILED:			
			bms.precharge_enable = true;	
			ass.break_loop_precharge = true;
			car_control.inverters_energise = false;
			car_control.inverters_enable = false;
            car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			break;
	}
}
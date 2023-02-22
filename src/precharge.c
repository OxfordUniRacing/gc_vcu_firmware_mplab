//=============================INCLUDES
#include <xc.h>
#include <stdbool.h>
#include "precharge.h"
#include "pio.h"
#include "user.h"
#include "timer.h"
#include "inverter.h"

//==============================DEFINITIONS

//=============================GLOBAL VAR

bms_t bms = {0};
ass_t ass = {0};

//============================LOCAL VAR

//===================================LOCAL FUNC DECLARATIONS

//===========================================GLOBAL FUNC

void handle_precharge(void)
{
	static enum {
		PC_TS_OFF,						//The TS is not active
        PC_BMS_RELAY,                   //For handling the BMS relay
		PC_WAIT_FOR_INVERTERP,			//Waiting for communication from the inverters
		PC_WAIT_FOR_FINAL_VOLTAGE,		//Waiting for the inverter voltage to reach 95% of battery voltage
		PC_READY,						//Ready to for BMS to exit precharge
		PC_FAILED						//A timeout has occured, set flag for VCU relay to open 
	} PRECHARGE_STATE = PC_TS_OFF;		//Different possible precharge states
	
	static uint32_t precharge_start_time = 0;

	
	switch(PRECHARGE_STATE)
	{
		case PC_TS_OFF:
			bms.precharge_enable = true;
			ass.break_loop_precharge = false;
            
            
		
			if(ts_active())
			{
				PRECHARGE_STATE = PC_BMS_RELAY;
				precharge_start_time = current_time_ms();
                SYS_CONSOLE_PRINT("PC_TS_OFF_SUCCESS\n\r");
			}
			break;
           
        case PC_BMS_RELAY:
            if(bms.relay_state){
                PRECHARGE_STATE = PC_WAIT_FOR_INVERTERP;
                SYS_CONSOLE_PRINT("PC_BMS_RELAY_SUCCESS\n\r");
            }
            if(has_delay_passed(precharge_start_time,250)){
                PRECHARGE_STATE = PC_FAILED;
                SYS_CONSOLE_PRINT("PC_BMS_RELAY_FAIL\n\r");
            }
            break;
            
        case PC_WAIT_FOR_INVERTERP:
			bms.precharge_enable = true;
			ass.break_loop_precharge = false;
			
			if(comms_active.inv1 && comms_active.inv2)
			{
				PRECHARGE_STATE = PC_WAIT_FOR_FINAL_VOLTAGE;
                SYS_CONSOLE_PRINT("PC_WAIT_FOR_INVERTER_SUCCESS\n\r");
			}
			else
			{
				//@@ Needs to calculate total delay
				//t = RC ln ( Vbat / (Vbat - 30*1.2) ) * 1000
				if(has_delay_passed(precharge_start_time, 5000))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_WAIT_FOR_INVERTER_FAIL\n\r");
				}
				//Checked we have received communication from inverter
				//else check how much time has passed
			}
			

			break;
		case PC_WAIT_FOR_FINAL_VOLTAGE:
			bms.precharge_enable = true;
			ass.break_loop_precharge = true;
		
			//Read battery voltage
			//Check inverter voltage has reached 95% of battery voltage
			//If not, check how much time has passed, exit if necessary
			
			if(get_inv_lowest_voltage() > bms.voltage * 0.95)
			{
				PRECHARGE_STATE = PC_READY;
                SYS_CONSOLE_PRINT("PC_WAIT_FOR_FINAL_VOLTAGE_SUCCESS\n\r");
			}
			else
			{
				//t = 1000* -RCln(1-0.95) =1000* RCln20 = 3743
				if(has_delay_passed(precharge_start_time, 3743))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_WAIT_FOR_FINAL_VOLTAGE_FAIL\n\r");
				}
			}
			
			break;
		case PC_READY:
			bms.precharge_enable = false;
			ass.break_loop_precharge = false;
			break;
		case PC_FAILED:
			bms.precharge_enable = true;
			ass.break_loop_precharge = true;
			break;
	}
}

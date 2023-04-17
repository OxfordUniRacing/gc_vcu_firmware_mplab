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

//==============================DEFINITIONS
#define WRITE_PARAMETERS    true

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
    .precharge_enable = true
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
    
    inv2.POSITIVE_SLEW_RATE = 200;
    inv2.NEGATIVE_SLEW_RATE = 400;
    inv2.RESPONSE_TIME = 50;
    inv2.POLE_PAIRS = 1;
    
    static enum {
		PC_TS_OFF,						//The TS is not active
        PC_BMS_RELAY,                   //For handling the BMS relay
		PC_WAIT_FOR_INVERTER,			//Waiting for communication from the inverters
		PC_WAIT_FOR_FINAL_VOLTAGE,		//Waiting for the inverter voltage to reach 95% of battery voltage
        PC_WRITE_INVERTER_PARAMETERS,
		PC_READY,						//Ready to for BMS to exit precharge
		PC_FAILED						//A timeout has occured, set flag for VCU relay to open 
	} PRECHARGE_STATE = PC_TS_OFF;		//Different possible precharge states
    
    if(!car_control.ignition){
         //driver stopped the car safely, reset the precharge sequence
        if(PRECHARGE_STATE == PC_READY){         
            PRECHARGE_STATE = PC_TS_OFF;
            UART1_Write("asd",3);
            UART2_Write("asd",3);
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
            car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
            
			if(car_control.ignition)
			{
				PRECHARGE_STATE = PC_BMS_RELAY;
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
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
            
            //bms.ams_precharge_enabled included for clarity, but ts_active() will always imply bms.ams_precharge_enabled
            if(ts_active() && bms.ams_precharge_enabled)
			{
                PRECHARGE_STATE = PC_WAIT_FOR_INVERTER;
                SYS_CONSOLE_PRINT("PC_BMS_RELAY_SUCCESS\n\r");
            }
            if(has_delay_passed(precharge_start_time,250))
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
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
            
			if(comms_active.inv1 && comms_active.inv2)
			{
				
				
				PRECHARGE_STATE = PC_WAIT_FOR_FINAL_VOLTAGE;
                SYS_CONSOLE_PRINT("PC_WAIT_FOR_INVERTER_SUCCESS\n\r");
			}
			else
			{
				//@@ Needs to calculate total delay
				//t = RC ln ( Vbat / (Vbat - 30*1.2) ) * 1000
                
				if(has_delay_passed(precharge_start_time, 3000))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_WAIT_FOR_INVERTER_FAIL\n\r");
				}
				//Checked we have received communication from inverter
				//else check how much time has passed
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
			car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			
            
			if(		get_inv_lowest_voltage() + (INVERTER_PRECHARGE_CURRENT * INVERTER_PRECHARGE_RESISTANCE)
					> bms.voltage * 0.95)
			{
				PRECHARGE_STATE = PC_WRITE_INVERTER_PARAMETERS;
                SYS_CONSOLE_PRINT("PC_WAIT_FOR_FINAL_VOLTAGE_SUCCESS\n\r");
			}
			else
			{
				//t = 1000* -RCln(1-0.95) =1000* RCln20 = 3743
				if(has_delay_passed(precharge_start_time, 5000))
				{
					PRECHARGE_STATE = PC_FAILED;
                    SYS_CONSOLE_PRINT("PC_WAIT_FOR_FINAL_VOLTAGE_FAIL\n\r");
				}
			}
			
			break;
            
        case PC_WRITE_INVERTER_PARAMETERS:
            if(WRITE_PARAMETERS){
                if(handle_inverter_parameters()) PRECHARGE_STATE = PC_READY;
            }
            else{
                PRECHARGE_STATE = PC_READY;
                UART1_Write("s0",2);
                UART2_Write("s0",2);
            }
            
            bms.precharge_enable = false;
			ass.break_loop_precharge = false;
            car_control.precharge_ready = true;
            car_control.inverter_params_complete = false;
            break;
            
		case PC_READY:
			bms.precharge_enable = false;
			ass.break_loop_precharge = false;
            car_control.precharge_ready = true;
            car_control.inverter_params_complete = true;
			break;
		case PC_FAILED:			
			bms.precharge_enable = true;	
			ass.break_loop_precharge = true;
            car_control.precharge_ready = false;
            car_control.inverter_params_complete = false;
			break;
	}
}

static bool handle_inverter_parameters(void){
    static enum{
        START_COMMAND,
        POSITIVE_SLEW_RATE_COMMAND,
        NEGATIVE_SLEW_RATE_COMMAND,
        RESPONSE_TIME_COMMAND,
        CURRENT_LIMIT_COMMAND,
        PHASE_CURRENT_LIMIT_COMMAND,
        POLE_PAIRS_COMMAND,
        UNDERVOLTAGE_COMMAND,
        SAVE_COMMAND,
        END_COMMAND        
    } INVERTER_COMMAND_STATE = START_COMMAND;
    
    char positive_slew_rate[5];
    sprintf(positive_slew_rate,"%s%03d",INVERTER_POSITIVE_SLEW_RATE_COMMAND,inv1.POSITIVE_SLEW_RATE);
    
    char negative_slew_rate[5];
    sprintf(negative_slew_rate,"%s%03d",INVERTER_NEGATIVE_SLEW_RATE_COMMAND,inv1.NEGATIVE_SLEW_RATE);
    
    char response_time[5];
    sprintf(response_time,"%s%03d",INVERTER_RESPONSE_TIME_COMMAND,inv1.RESPONSE_TIME);
    
    char current_input_limit[5];
    sprintf(current_input_limit,"%s%03d",INVERTER_CURRENT_LIMIT_COMMAND,bms.pack_dlc/2);
    
    char phase_current_input_limit[5];
    sprintf(phase_current_input_limit,"%s%03d",INVERTER_PHASE_CURRENT_LIMIT_COMMAND,200);
    
    char pole_pairs[5];
    sprintf(pole_pairs,"%s%03d",INVERTER_POLE_PAIRS_COMMAND,inv1.POLE_PAIRS);
    
    //we're skipping states
    switch(INVERTER_COMMAND_STATE){
        case START_COMMAND:
            UART1_Write("sa",2);
            UART2_Write("sa",2);
            parameter_write_start_time = current_time_ms();
            INVERTER_COMMAND_STATE = POSITIVE_SLEW_RATE_COMMAND;
            break;
          
        case POSITIVE_SLEW_RATE_COMMAND:
            if(has_delay_passed(parameter_write_start_time,100)){
                parameter_write_start_time = current_time_ms();
                UART1_Write(positive_slew_rate,5);
                UART2_Write(positive_slew_rate,5);
                INVERTER_COMMAND_STATE = NEGATIVE_SLEW_RATE_COMMAND;
            }
            break;
            
        case NEGATIVE_SLEW_RATE_COMMAND:
            if(has_delay_passed(parameter_write_start_time,100)){
                parameter_write_start_time = current_time_ms();
                UART1_Write(negative_slew_rate,5);
                UART2_Write(negative_slew_rate,5);
                INVERTER_COMMAND_STATE = RESPONSE_TIME_COMMAND;
            }
            break;
                        
        case RESPONSE_TIME_COMMAND:
            if(has_delay_passed(parameter_write_start_time,100)){
                parameter_write_start_time = current_time_ms();
                UART1_Write(response_time,5);
                UART2_Write(response_time,5);
                INVERTER_COMMAND_STATE = CURRENT_LIMIT_COMMAND;
            }
            break;
            
        case CURRENT_LIMIT_COMMAND:
            if(has_delay_passed(parameter_write_start_time,100)){    
                parameter_write_start_time = current_time_ms();
                UART1_Write(current_input_limit,5);
                UART2_Write(current_input_limit,5);
                INVERTER_COMMAND_STATE = PHASE_CURRENT_LIMIT_COMMAND;
            }
            break;
            
        case PHASE_CURRENT_LIMIT_COMMAND:
            if(has_delay_passed(parameter_write_start_time,100)){    
                parameter_write_start_time = current_time_ms();
                UART1_Write(phase_current_input_limit,5);
                UART2_Write(phase_current_input_limit,5);
                INVERTER_COMMAND_STATE = POLE_PAIRS_COMMAND;
            }
            break;
            
        case POLE_PAIRS_COMMAND:
            if(has_delay_passed(parameter_write_start_time,100)){
                parameter_write_start_time = current_time_ms();
                UART1_Write(pole_pairs,5);
                UART2_Write(pole_pairs,5);
                INVERTER_COMMAND_STATE = UNDERVOLTAGE_COMMAND;
            }
            break;
        
        case UNDERVOLTAGE_COMMAND:
            if(has_delay_passed(parameter_write_start_time,100)){
                parameter_write_start_time = current_time_ms();
                UART1_Write(INVERTER_UNDERVOLTAGE_COMMAND,5);
                UART2_Write(INVERTER_UNDERVOLTAGE_COMMAND,5);
                INVERTER_COMMAND_STATE = SAVE_COMMAND;
            }
            break;
            
        case SAVE_COMMAND:
            if(has_delay_passed(parameter_write_start_time,100)){
                parameter_write_start_time = current_time_ms();
                UART1_Write("wp",2);
                UART2_Write("wp",2);
                INVERTER_COMMAND_STATE = END_COMMAND;
            }
            break;
            
        case END_COMMAND:
            if(has_delay_passed(parameter_write_start_time,30)){    
                UART1_Write("s0",2);
                UART2_Write("s0",2);
                INVERTER_COMMAND_STATE = START_COMMAND;
                return true;
            }
            break;
    }
    
    return false;
}
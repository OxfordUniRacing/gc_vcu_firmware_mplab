//====================INCLUDES==================================================
#include <xc.h>
#include <stdbool.h>
#include "pio.h"
#include "timer.h"
#include "precharge.h"
#include "user.h"
#include "car_control.h"

#include "peripheral/pio/plib_pio.h"
#include "peripheral/pwm/plib_pwm0.h"
#include "peripheral/pwm/plib_pwm_common.h"
#include "peripheral/afec/plib_afec0.h"
#include "peripheral/afec/plib_afec_common.h"

//===================DEFINITIONS================================================
#define ASS_CLOSED 1
#define ASS_OPEN 0
#define TS_ACTIVE_BOUNCE_TIME 20
#define RTD_SOUND_TIME 1500
#define ASS_LOOP_STOP_TIME  300
#define BRAKE_PRESSURE_THRESHOLD 0.3f

//===================GLOBAL VARIABLES===========================================

//===================LOCAL VARIABLES============================================
//static volatile bool ts_active_local = false;
static volatile bool debounce_countdown_started = false;
static volatile uint32_t debounce_timer = -500;
static volatile bool rtd_sounded = false;
static volatile uint32_t rtd_sound_timer = 0;
static volatile bool ass_latched_open = false;
static volatile uint32_t ass_timer = 0;
static volatile bool ignition_local = false;
static volatile uint32_t ignition_timer = 0;

//===================LOCAL FUNCTION DECLARATIONS================================

//===================GLOBAL FUNCTIONS===========================================

void init_pio(void){
    TS_INPUT_InputEnable();
    ASS_PIN_RELAY_OutputEnable();
    BRAKE_LIGHT_OutputEnable();
    RTD_SOUND_OutputEnable();
    PIO_PinWrite(RTD_SOUND_PIN,0);
    //PWM0_ChannelsStop(PWM_CHANNEL_1_MASK); //disable buzzer pwm to start
    AFEC0_ChannelsEnable(AFEC_CH8_MASK); //enable ADC on brake pressure sensor
}

void handle_pio(void){
    AFEC0_ConversionStart();
    while(!AFEC0_ChannelResultIsReady(AFEC_CH8)); //wait for reading
    car_control.brake_pressure = //result*3.3/65535 gets voltage, *2.36 provides the factor for the potential divider
                                //subtracting 0.5 takes away the constant term from the affine conversion
                                //multiplying by 25 gives the answer in bar
            ((float)AFEC0_ChannelResultGet(AFEC_CH8)*7.788f/65535U-0.5)*25;
    car_control.brake_on = car_control.brake_pressure > BRAKE_PRESSURE_THRESHOLD;
    
    bool ass_close =	!ass.break_loop_precharge &&
						!ass.break_loop_ts_deactive &&
						!ass.break_loop_inverter_error &&
                        !ass.break_loop_ins_detect &&
                        !ass.break_loop_timeout;
    
    //if(ass_latched_open) SYS_CONSOLE_PRINT("%d",ass_latched_open);
    if(!ass_close || ass_latched_open){ //a condition to break the loop has been met
        //SYS_CONSOLE_PRINT("ASS_CLOSE: %d\n\rASS_LATCHED_OPEN: %d\n\r",ass_close,ass_latched_open);
        if(ass_latched_open){ //the timer to break the loop has started
            uint8_t zero[] = {'0'}; //send 0s to the motors to try to get them to stop within 300ms
            UART1_Write(zero,1);
            UART2_Write(zero,1);
            
            //The point of this delay is to ensure that the pack current is small to avoid damaging the contactors
            //Therefore we open the ass loop if the current is small enough or after 300ms, whichever comes first
            if(has_delay_passed(ass_timer,ASS_LOOP_STOP_TIME) || bms.current < 1){
                PIO_PinWrite(ASS_PIN_RELAY_PIN, ASS_OPEN);
            }
        }
        else{ //the timer hasn't started, so set the flag and start the timer
            ass_latched_open = true;
            ass_timer = current_time_ms();
        }
    }
    else{ //the ass loop can safely remain closed, provided the driver has started the car
        if(car_control.ignition && (bms.ams_precharge_enabled || car_control.precharge_ready)){
            PIO_PinWrite(ASS_PIN_RELAY_PIN,ASS_CLOSED);
            //SYS_CONSOLE_PRINT("ASS_CLOSED");
            if(!ignition_local){
                ignition_local = true;
                ignition_timer = current_time_ms();
            }
            else if(!ts_active() && has_delay_passed(ignition_timer,TS_ACTIVE_BOUNCE_TIME)){
                ass.break_loop_ts_deactive = true;
                bms.precharge_enable = true;
            }
        }
        
        else { 
            PIO_PinWrite(ASS_PIN_RELAY_PIN,ASS_OPEN);
            ignition_local = false;
        }
    }
    
    /*if(ts_active_local != TS_INPUT_Get()){
        if(debounce_countdown_started){
            if(has_delay_passed(debounce_timer,TS_ACTIVE_BOUNCE_TIME)){
                ts_active_local = TS_INPUT_Get();
                debounce_countdown_started = false;
				SYS_CONSOLE_PRINT("TS CHANGED: %d\n\r", TS_INPUT_Get());
            }
        }
        else{
            debounce_countdown_started = true;
            debounce_timer = current_time_ms();
        }
    }*/
    
    if(car_control.ready_to_drive && !rtd_sounded){
        //PWM0_ChannelsStart(PWM_CHANNEL_1_MASK);
        PIO_PinWrite(RTD_SOUND_PIN,1);
        rtd_sounded = true;
        rtd_sound_timer = current_time_ms();
    }
    if(rtd_sounded && has_delay_passed(rtd_sound_timer,RTD_SOUND_TIME)){
        //PWM0_ChannelsStop(PWM_CHANNEL_1_MASK);
        PIO_PinWrite(RTD_SOUND_PIN,0);
        if(!car_control.ready_to_drive){ //reset condition
            rtd_sounded = false;
        }
    }
    
    PIO_PinWrite(BRAKE_LIGHT_PIN,car_control.brake_on);
}

bool ts_active(void){
    //return ts_active_local;
    return TS_INPUT_Get();
}
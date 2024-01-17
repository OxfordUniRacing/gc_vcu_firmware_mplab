/* ************************************************************************** */
/* ************************************************************************** */

#ifndef _GLOBALS_H    /* Guard against multiple inclusion */
#define _GLOBALS_H





//=============================DEBUG DEFINES===========================
#define DEBUG_IGNORE_BMS	//If defined, does not require BMS to be connected to operate											

//#define DEBUG_IGNORE_ASS	//If defined, assumes ASS loop is always closed

//#define DEBUG_IGNORE_TS	//If defined, will assume that the TS is on and has no issues

//#define DEBUG_IGNORE_IGNITION	//If defined, does not requrie ignition to operate

//#define DEBUG_PERMENANT_BRAKE //IF defined, assumes brake is always pressed

#define DEBUG_PRINT_INVERTER_MESSAGES

//===========================GLOBAL PARAMTERS==================================
#define THROTTLE_SCALE_DOWN 10

#define ASS_CLOSED 1
#define ASS_OPEN 0
#define TS_ACTIVE_BOUNCE_TIME 2000
#define RTD_SOUND_TIME 2500							
#define ASS_LOOP_STOP_TIME  300
#define BRAKE_PRESSURE_THRESHOLD 0.5f				//Threshold to consider the brakes active (BAR)





#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */

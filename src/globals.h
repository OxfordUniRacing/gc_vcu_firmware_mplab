/* ************************************************************************** */
/* ************************************************************************** */

#ifndef _GLOBALS_H    /* Guard against multiple inclusion */
#define _GLOBALS_H





//=============================DEBUG DEFINES===========================
//#define DEBUG_IGNORE_BMS	//If defined, does not require BMS to be connected to operate											

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
#define BRAKE_PRESSURE_THRESHOLD 1.0f				//Threshold to consider the brakes active (BAR)



#define INV_RIGHT_ADDRESS	(0x71)	//INV1
#define INV_LEFT_ADDRESS	(0x72)	//INV2
#define SOURCE_ADDRESS		(0x01)

#define PGN_HC1				(0x11000)
#define PGN_HC2				(0x11100)
#define PGN_HC3				(0x11200)

#define PGN_HS1				(0x11800)
#define PGN_HS2				(0x11900)
#define PGN_HS3				(0x11A00)
#define PGN_HS4				(0x11B00)


typedef enum {
		STATUSWORD_NOTREADY	= 0x01,
		STATUSWORD_SHUTDOWN = 0x02,
		STATUSWORD_PRECHARGE = 0x04,
		STATUSWORD_ENERGISED = 0x07,
		STATUSWORD_ENABLED = 0x08,
		STATUSWORD_FAULTREACTION = 0x0B,
		STATUSWORD_FAULTOFF = 0x0D
}statusword_t;


#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */

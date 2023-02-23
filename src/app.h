

#ifndef _APP_H
#define _APP_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "configuration.h"
#include "system/console/sys_console.h"

typedef struct
{
	bool ready_to_drive;
}control_t;

extern control_t car_control;

void APP_Initialize ( void );


void APP_Tasks( void );



#endif /* _APP_H */


/* ************************************************************************** */
/** Descriptive File Name

  @Company
	Company Name

  @File Name
	filename.h

  @Summary
	Brief description of the file.

  @Description
	Describe the purpose of this file.
 */
/* ************************************************************************** */


#ifndef CAN_INVERTERS_H    /* Guard against multiple inclusion */
#define CAN_INVERTERS_H

#include "globals.h"

void update_HC1_drive(void);
void update_HC1_energise(void);
void update_HC1_shutdown(void);
void update_HC2(void);
void update_HC3(void);

void parse_HS1(inv_t* inv, uint8_t data[]);
void parse_HS2(inv_t* inv, uint8_t data[]);
void parse_HS3(inv_t* inv, uint8_t data[]);

#endif /* _EXAMPLE_FILE_NAME_H */



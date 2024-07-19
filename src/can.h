#ifndef CAN_H
#define CAN_H



void handle_can(void);
void init_can(void);

void send_can_message(uint32_t id, uint8_t data[],int length);



#endif
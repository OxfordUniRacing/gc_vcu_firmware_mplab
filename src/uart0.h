#ifndef UART0_H
#define UART0_H

void init_uart(void);
void handle_uart(void);
void send_uart(int pedal_val);

#endif
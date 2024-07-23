

/*
 * Inverters use J1939 protocol, which is compatabile with non J1939 devices
 * Uses extended Id (29 bit)
 * Uses PDU-1 Format
 * 
 * 29 bits
 *		28-26	Priority			(3)
 *		25		Reserved			(1)
 *		24-16	PGN					(9+8)	Destination address is just last 2 bytes of PGN
 *		15-8	Destination Address	(8)
 *		7-0		Source Address		(8)
 */

/*
 * Under H Protocol, there are 3 PGNs that can be transmitted
 * 
 * 0x11000	HC1  Torque Demand message 1 - 5ms base period
 *		Torque Demand
 *		Control Word
 *		Drive Torque Limit
 *		SEQ
 *		CS
 * 
 * 0x11100	HC2 Torque Demand message 2 - 5ms base period
 *		Regen Torque Limit
 *		Fwd speed limit
 *		Rev speed limit
 *		SEQ
 *		CS
 * 
 * 0x11200	HC3 Battery demands - 50ms base period
 *		Battery discharge limit
 *		Battery charge limit
 *		Target capacitor voltage
 *		SEQ
 *		CS
 */

#include "peripheral/mcan/plib_mcan0.h"
#include "peripheral/mcan/plib_mcan_common.h"

#include <xc.h>
#include <stdbool.h>
#include "globals.h"
#include "inverter.h"
#include "car_control.h"




#define TRQ_LIMIT			(5*160)		//160 bits per nm	
#define RPM_LIMIT			(500)

#define BAT_DISCHARGE_LIM	(10)
#define BAT_RECHARGE_LIM	(-10)
#define TARGET_CAP_VOLTAGE	(100*16)	//16 bits per V


#define CONTROLWORLD_ENERGISE	(0x0003)
#define CONTROLWORLD_ENABLE		(0x0005)
#define CONTROLWORLD_SHUTDOWN	(0x0006)

int16_t torque_to_bits(float torque);
int16_t voltage_to_bits(float voltage);


void transmit_HC1(
				uint8_t dest_address, 
				uint16_t trq_demand, 
				uint16_t cntrlword,
				uint16_t drive_trq_lim)
{
	// HC1: PGN 0x110(00)
	
	uint32_t id = ((PGN_HC1 + dest_address) << 8) + SOURCE_ADDRESS;
	uint32_t length = 8;
	
	uint8_t data[8];
	
	data[0] = (uint8_t)(trq_demand);
	data[1] = (uint8_t)(trq_demand >> 8);
	
	data[2] = (uint8_t)(cntrlword);
	data[3] = (uint8_t)(cntrlword >> 8);

	data[4] = (uint8_t)(drive_trq_lim);
	data[5] = (uint8_t)(drive_trq_lim >> 8);
	
	
	data[6] = 0;		//Not using sequence
	data[7] = 0;		//Not using checksum
	
	MCAN_TX_BUFFER temp_tx_buf = {
        .data = *data,
        .dlc = length,
        .id = id,
    };
		
    MCAN0_MessageTransmitFifo(1,&temp_tx_buf);
}

/*
 * Sends HC1 message to both inverters
 * Assumes car is currently ready to drive
 */
void update_HC1_drive(void)
{
	transmit_HC1(INV_RIGHT_ADDRESS, get_inv1_cmd(), CONTROLWORLD_ENABLE, TRQ_LIMIT);
	transmit_HC1(INV_LEFT_ADDRESS, get_inv2_cmd(), CONTROLWORLD_ENABLE, TRQ_LIMIT);
}

void update_HC1_energise(void)
{
	transmit_HC1(INV_RIGHT_ADDRESS, 0, CONTROLWORLD_ENERGISE, TRQ_LIMIT);
	transmit_HC1(INV_LEFT_ADDRESS, 0, CONTROLWORLD_ENERGISE, TRQ_LIMIT);
}

void update_HC1_shutdown(void)
{
	transmit_HC1(INV_RIGHT_ADDRESS, 0, CONTROLWORLD_SHUTDOWN, TRQ_LIMIT);
	transmit_HC1(INV_LEFT_ADDRESS, 0, CONTROLWORLD_SHUTDOWN, TRQ_LIMIT);
}


void transmit_HC2(
				uint8_t dest_address, 
				uint16_t regen_trq_lim, 
				uint16_t fwd_speed_lim,
				uint16_t rev_speed_lim)
{
	// HC1: PGN 0x110(00)
	
	uint32_t id = ((PGN_HC2 + dest_address) << 8) + SOURCE_ADDRESS;
	uint32_t length = 8;
	
	uint8_t data[8];
	
	data[0] = (uint8_t)(regen_trq_lim);
	data[1] = (uint8_t)(regen_trq_lim >> 8);
	
	data[2] = (uint8_t)(fwd_speed_lim);
	data[3] = (uint8_t)(fwd_speed_lim >> 8);
	
	data[4] = (uint8_t)(rev_speed_lim);
	data[5] = (uint8_t)(rev_speed_lim >> 8);
	
	
	data[6] = 0;		//Not using sequence
	data[7] = 0;		//Not using checksum
	
	MCAN_TX_BUFFER temp_tx_buf = {
        .data = *data,
        .dlc = length,
        .id = id,
    };
		
    MCAN0_MessageTransmitFifo(1,&temp_tx_buf);
}


void update_HC2(void)
{	
	transmit_HC2(INV_RIGHT_ADDRESS, -1*TRQ_LIMIT, RPM_LIMIT, -1 * RPM_LIMIT);
	transmit_HC2(INV_LEFT_ADDRESS, -1*TRQ_LIMIT, RPM_LIMIT, -1 * RPM_LIMIT);
}

void transmit_HC3(
				uint8_t dest_address, 
				uint16_t bat_discharge_lim, 
				uint16_t bat_charge_lim,
				uint16_t target_cap_voltage)
{
	// HC1: PGN 0x110(00)
	
	uint32_t id = ((PGN_HC3 + dest_address) << 8) + SOURCE_ADDRESS;
	uint32_t length = 8;
	
	uint8_t data[8];
	
	data[0] = (uint8_t)(bat_discharge_lim);
	data[1] = (uint8_t)(bat_discharge_lim >> 8);
	
	data[2] = (uint8_t)(bat_charge_lim);
	data[3] = (uint8_t)(bat_charge_lim >> 8);
	
	data[4] = (uint8_t)(target_cap_voltage);
	data[5] = (uint8_t)(target_cap_voltage >> 8);
	
	data[6] = 0;		//Not using sequence
	data[7] = 0;		//Not using checksum
	
	MCAN_TX_BUFFER temp_tx_buf = {
        .data = *data,
        .dlc = length,
        .id = id,
    };
		
    MCAN0_MessageTransmitFifo(1,&temp_tx_buf);
}

void update_HC3(void)
{	
	transmit_HC3(INV_RIGHT_ADDRESS, BAT_DISCHARGE_LIM, BAT_RECHARGE_LIM, TARGET_CAP_VOLTAGE);
	transmit_HC3(INV_LEFT_ADDRESS, BAT_DISCHARGE_LIM, BAT_RECHARGE_LIM, TARGET_CAP_VOLTAGE);
}

/*
 * When data is broadcasted by the inverters,
 * 
 * Source address is 0x71 or 0x72
 * 
 * Destination address is 0xFF
 * 
 */


void parse_HS1(inv_t* inv, uint8_t data[])
{
	int16_t output_torque = 0;
	output_torque += data[0];
	output_torque += ((int16_t)data[1]) << 8;
	
	inv->measured_torque = (float)output_torque / 160;
	
	int16_t motor_speed = 0;
	motor_speed += data[2];
	motor_speed += ((int16_t)data[3]) << 8;
	
	inv->measured_motor_speed = motor_speed;
	
	int16_t battery_current = 0;
	battery_current += data[4];
	battery_current += ((int16_t)data[5]) << 8;
	
	inv->battery_current = battery_current;	
}

void parse_HS2(inv_t* inv, uint8_t data[])
{
	int16_t available_trq = 0;
	available_trq += data[0];
	available_trq += ((int16_t)data[1]) << 8;
	
	inv->available_forward_torque = (float)available_trq / 160;
	
	int16_t available_rev_trq = 0;
	available_rev_trq += data[2];
	available_rev_trq += ((int16_t)data[3]) << 8;
	
	inv->available_reverse_torque = (float)available_rev_trq / 160;
	
	inv->statusword = data[4];
}

void parse_HS3(inv_t* inv, uint8_t data[])
{
	int16_t measured_capacitor_voltage = 0;
	measured_capacitor_voltage += data[4];
	measured_capacitor_voltage += ((int16_t)data[5]) << 8;
	
	inv->capacitor_voltage = (float)measured_capacitor_voltage / 16;
}
/*******************************************************************************
  UART2 PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_uart2.c

  Summary:
    UART2 PLIB Implementation File

  Description:
    None

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

#include "device.h"
#include "plib_uart2.h"
#include "interrupts.h"

// *****************************************************************************
// *****************************************************************************
// Section: UART2 Implementation
// *****************************************************************************
// *****************************************************************************

UART_RING_BUFFER_OBJECT uart2Obj;

#define UART2_READ_BUFFER_SIZE      256
/* Disable Read, Overrun, Parity and Framing error interrupts */
#define UART2_RX_INT_DISABLE()      UART2_REGS->UART_IDR = (UART_IDR_RXRDY_Msk | UART_IDR_FRAME_Msk | UART_IDR_PARE_Msk | UART_IDR_OVRE_Msk);
/* Enable Read, Overrun, Parity and Framing error interrupts */
#define UART2_RX_INT_ENABLE()       UART2_REGS->UART_IER = (UART_IER_RXRDY_Msk | UART_IER_FRAME_Msk | UART_IER_PARE_Msk | UART_IER_OVRE_Msk);

static uint8_t UART2_ReadBuffer[UART2_READ_BUFFER_SIZE];

#define UART2_WRITE_BUFFER_SIZE     256
#define UART2_TX_INT_DISABLE()      UART2_REGS->UART_IDR = UART_IDR_TXEMPTY_Msk;
#define UART2_TX_INT_ENABLE()       UART2_REGS->UART_IER = UART_IER_TXEMPTY_Msk;

static uint8_t UART2_WriteBuffer[UART2_WRITE_BUFFER_SIZE];

void UART2_Initialize( void )
{
    /* Reset UART2 */
    UART2_REGS->UART_CR = (UART_CR_RSTRX_Msk | UART_CR_RSTTX_Msk | UART_CR_RSTSTA_Msk);

    /* Enable UART2 */
    UART2_REGS->UART_CR = (UART_CR_TXEN_Msk | UART_CR_RXEN_Msk);

    /* Configure UART2 mode */
    UART2_REGS->UART_MR = ((UART_MR_BRSRCCK_PERIPH_CLK) | (UART_MR_PAR_NO) | (0 << UART_MR_FILTER_Pos));

    /* Configure UART2 Baud Rate */
    UART2_REGS->UART_BRGR = UART_BRGR_CD(81);

    /* Initialize instance object */
    uart2Obj.rdCallback = NULL;
    uart2Obj.rdInIndex = 0;
	uart2Obj.rdOutIndex = 0;
    uart2Obj.isRdNotificationEnabled = false;
    uart2Obj.isRdNotifyPersistently = false;
    uart2Obj.rdThreshold = 0;
    uart2Obj.wrCallback = NULL;
    uart2Obj.wrInIndex = 0;
	uart2Obj.wrOutIndex = 0;
    uart2Obj.isWrNotificationEnabled = false;
    uart2Obj.isWrNotifyPersistently = false;
    uart2Obj.wrThreshold = 0;

    /* Enable receive interrupt */
    UART2_RX_INT_ENABLE()
}

bool UART2_SerialSetup( UART_SERIAL_SETUP *setup, uint32_t srcClkFreq )
{
    bool status = false;
    uint32_t baud;
    uint32_t brgVal = 0;
    uint32_t uartMode;

    if (setup != NULL)
    {
        baud = setup->baudRate;

        if(srcClkFreq == 0)
        {
            srcClkFreq = UART2_FrequencyGet();
        }

        /* Calculate BRG value */
        brgVal = srcClkFreq / (16 * baud);

        /* If the target baud rate is acheivable using this clock */
        if (brgVal <= 65535)
        {
            /* Configure UART2 mode */
            uartMode = UART2_REGS->UART_MR;
            uartMode &= ~UART_MR_PAR_Msk;
            UART2_REGS->UART_MR = uartMode | setup->parity ;

            /* Configure UART2 Baud Rate */
            UART2_REGS->UART_BRGR = UART_BRGR_CD(brgVal);

            status = true;
        }
    }

    return status;
}

static void UART2_ErrorClear( void )
{
    uint8_t dummyData = 0u;

    UART2_REGS->UART_CR = UART_CR_RSTSTA_Msk;

    /* Flush existing error bytes from the RX FIFO */
    while( UART_SR_RXRDY_Msk == (UART2_REGS->UART_SR & UART_SR_RXRDY_Msk) )
    {
        dummyData = (UART2_REGS->UART_RHR & UART_RHR_RXCHR_Msk);
    }

    /* Ignore the warning */
    (void)dummyData;
}

UART_ERROR UART2_ErrorGet( void )
{
    UART_ERROR errors = UART_ERROR_NONE;
    uint32_t status = UART2_REGS->UART_SR;

    errors = (UART_ERROR)(status & (UART_SR_OVRE_Msk | UART_SR_PARE_Msk | UART_SR_FRAME_Msk));

    if(errors != UART_ERROR_NONE)
    {
        UART2_ErrorClear();
    }

    /* All errors are cleared, but send the previous error state */
    return errors;
}

/* This routine is only called from ISR. Hence do not disable/enable USART interrupts. */
static inline bool UART2_RxPushByte(uint8_t rdByte)
{
    uint32_t tempInIndex;
    bool isSuccess = false;

    tempInIndex = uart2Obj.rdInIndex + 1;

    if (tempInIndex >= UART2_READ_BUFFER_SIZE)
    {
        tempInIndex = 0;
    }

    if (tempInIndex == uart2Obj.rdOutIndex)
    {
        /* Queue is full - Report it to the application. Application gets a chance to free up space by reading data out from the RX ring buffer */
        if(uart2Obj.rdCallback != NULL)
        {
            uart2Obj.rdCallback(UART_EVENT_READ_BUFFER_FULL, uart2Obj.rdContext);
        }

        /* Read the indices again in case application has freed up space in RX ring buffer */
        tempInIndex = uart2Obj.rdInIndex + 1;

        if (tempInIndex >= UART2_READ_BUFFER_SIZE)
        {
            tempInIndex = 0;
        }

    }

    if (tempInIndex != uart2Obj.rdOutIndex)
    {
        UART2_ReadBuffer[uart2Obj.rdInIndex] = rdByte;
        uart2Obj.rdInIndex = tempInIndex;
        isSuccess = true;
    }
    else
    {
        /* Queue is full. Data will be lost. */
    }

    return isSuccess;
}

/* This routine is only called from ISR. Hence do not disable/enable USART interrupts. */
static void UART2_ReadNotificationSend(void)
{
    uint32_t nUnreadBytesAvailable;

    if (uart2Obj.isRdNotificationEnabled == true)
    {
        nUnreadBytesAvailable = UART2_ReadCountGet();

        if(uart2Obj.rdCallback != NULL)
        {
            if (uart2Obj.isRdNotifyPersistently == true)
            {
                if (nUnreadBytesAvailable >= uart2Obj.rdThreshold)
                {
                    uart2Obj.rdCallback(UART_EVENT_READ_THRESHOLD_REACHED, uart2Obj.rdContext);
                }
            }
            else
            {
                if (nUnreadBytesAvailable == uart2Obj.rdThreshold)
                {
                    uart2Obj.rdCallback(UART_EVENT_READ_THRESHOLD_REACHED, uart2Obj.rdContext);
                }
            }
        }
    }
}

size_t UART2_Read(uint8_t* pRdBuffer, const size_t size)
{
    size_t nBytesRead = 0;
	uint32_t rdOutIndex;
	uint32_t rdInIndex;

    while (nBytesRead < size)
    {
        UART2_RX_INT_DISABLE();
		
		rdOutIndex = uart2Obj.rdOutIndex;
		rdInIndex = uart2Obj.rdInIndex;

        if (rdOutIndex != rdInIndex)
        {
            pRdBuffer[nBytesRead++] = UART2_ReadBuffer[uart2Obj.rdOutIndex++];

            if (uart2Obj.rdOutIndex >= UART2_READ_BUFFER_SIZE)
            {
                uart2Obj.rdOutIndex = 0;
            }
            UART2_RX_INT_ENABLE();
        }
        else
        {
            UART2_RX_INT_ENABLE();
            break;
        }
    }

    return nBytesRead;
}

size_t UART2_Peek(uint8_t* pRdBuffer)
{
    size_t nBytesRead = 0;
	uint32_t rdOutIndex;
	uint32_t rdInIndex;

    while (nBytesRead < 1)
    {
        //UART2_RX_INT_DISABLE();
		
		rdOutIndex = uart2Obj.rdOutIndex;
		rdInIndex = uart2Obj.rdInIndex;

        if (rdOutIndex != rdInIndex)
        {
            pRdBuffer[nBytesRead++] = UART2_ReadBuffer[(rdOutIndex+UART2_ReadCountGet()-1)%UART2_READ_BUFFER_SIZE];

            //UART2_RX_INT_ENABLE();
        }
        else
        {
            //UART2_RX_INT_ENABLE();
            break;
        }
    }

    return nBytesRead;
}

size_t UART2_ReadCountGet(void)
{
    size_t nUnreadBytesAvailable;
	uint32_t rdInIndex;
	uint32_t rdOutIndex;
    
	/* Take  snapshot of indices to avoid creation of critical section */
	rdInIndex = uart2Obj.rdInIndex;
	rdOutIndex = uart2Obj.rdOutIndex;

    if ( rdInIndex >=  rdOutIndex)
    {
        nUnreadBytesAvailable =  rdInIndex - rdOutIndex;
    }
    else
    {
        nUnreadBytesAvailable =  (UART2_READ_BUFFER_SIZE -  rdOutIndex) + rdInIndex;
    }
    
    return nUnreadBytesAvailable;
}

size_t UART2_ReadFreeBufferCountGet(void)
{
    return (UART2_READ_BUFFER_SIZE - 1) - UART2_ReadCountGet();
}

size_t UART2_ReadBufferSizeGet(void)
{
    return (UART2_READ_BUFFER_SIZE - 1);
}

bool UART2_ReadNotificationEnable(bool isEnabled, bool isPersistent)
{
    bool previousStatus = uart2Obj.isRdNotificationEnabled;

    uart2Obj.isRdNotificationEnabled = isEnabled;

    uart2Obj.isRdNotifyPersistently = isPersistent;

    return previousStatus;
}

void UART2_ReadThresholdSet(uint32_t nBytesThreshold)
{
    if (nBytesThreshold > 0)
    {
        uart2Obj.rdThreshold = nBytesThreshold;
    }
}

void UART2_ReadCallbackRegister( UART_RING_BUFFER_CALLBACK callback, uintptr_t context)
{
    uart2Obj.rdCallback = callback;

    uart2Obj.rdContext = context;
}

/* This routine is only called from ISR. Hence do not disable/enable USART interrupts. */
static bool UART2_TxPullByte(uint8_t* pWrByte)
{
    bool isSuccess = false;
	uint32_t wrOutIndex = uart2Obj.wrOutIndex;
	uint32_t wrInIndex = uart2Obj.wrInIndex;

    if (wrOutIndex != wrInIndex)
    {
        *pWrByte = UART2_WriteBuffer[uart2Obj.wrOutIndex++];

        if (uart2Obj.wrOutIndex >= UART2_WRITE_BUFFER_SIZE)
        {
            uart2Obj.wrOutIndex = 0;
        }
        isSuccess = true;
    }

    return isSuccess;
}

static inline bool UART2_TxPushByte(uint8_t wrByte)
{
    uint32_t tempInIndex;
    bool isSuccess = false;

    tempInIndex = uart2Obj.wrInIndex + 1;

    if (tempInIndex >= UART2_WRITE_BUFFER_SIZE)
    {
        tempInIndex = 0;
    }
    if (tempInIndex != uart2Obj.wrOutIndex)
    {
        UART2_WriteBuffer[uart2Obj.wrInIndex] = wrByte;
        uart2Obj.wrInIndex = tempInIndex;
        isSuccess = true;
    }
    else
    {
        /* Queue is full. Report Error. */
    }

    return isSuccess;
}

/* This routine is only called from ISR. Hence do not disable/enable USART interrupts. */
static void UART2_WriteNotificationSend(void)
{
    uint32_t nFreeWrBufferCount;

    if (uart2Obj.isWrNotificationEnabled == true)
    {
        nFreeWrBufferCount = UART2_WriteFreeBufferCountGet();

        if(uart2Obj.wrCallback != NULL)
        {
            if (uart2Obj.isWrNotifyPersistently == true)
            {
                if (nFreeWrBufferCount >= uart2Obj.wrThreshold)
                {
                    uart2Obj.wrCallback(UART_EVENT_WRITE_THRESHOLD_REACHED, uart2Obj.wrContext);
                }
            }
            else
            {
                if (nFreeWrBufferCount == uart2Obj.wrThreshold)
                {
                    uart2Obj.wrCallback(UART_EVENT_WRITE_THRESHOLD_REACHED, uart2Obj.wrContext);
                }
            }
        }
    }
}

static size_t UART2_WritePendingBytesGet(void)
{
    size_t nPendingTxBytes;
	
	/* Take a snapshot of indices to avoid creation of critical section */
	uint32_t wrOutIndex = uart2Obj.wrOutIndex;
	uint32_t wrInIndex = uart2Obj.wrInIndex;

    if ( wrInIndex >=  wrOutIndex)
    {
        nPendingTxBytes =  wrInIndex -  wrOutIndex;
    }
    else
    {
        nPendingTxBytes =  (UART2_WRITE_BUFFER_SIZE -  wrOutIndex) + wrInIndex;
    }

    return nPendingTxBytes;
}

size_t UART2_WriteCountGet(void)
{
    size_t nPendingTxBytes;    

    nPendingTxBytes = UART2_WritePendingBytesGet();

    return nPendingTxBytes;
}

size_t UART2_Write(uint8_t* pWrBuffer, const size_t size )
{
    size_t nBytesWritten  = 0;

    UART2_TX_INT_DISABLE();

    while (nBytesWritten < size)
    {
        if (UART2_TxPushByte(pWrBuffer[nBytesWritten]) == true)
        {
            nBytesWritten++;
        }
        else
        {
            /* Queue is full, exit the loop */
            break;
        }
    }

    /* Check if any data is pending for transmission */
    if (UART2_WritePendingBytesGet() > 0)
    {
        /* Enable TX interrupt as data is pending for transmission */
        UART2_TX_INT_ENABLE();
    }

    return nBytesWritten;
}

size_t UART2_WriteFreeBufferCountGet(void)
{
    return (UART2_WRITE_BUFFER_SIZE - 1) - UART2_WriteCountGet();
}

size_t UART2_WriteBufferSizeGet(void)
{
    return (UART2_WRITE_BUFFER_SIZE - 1);
}

bool UART2_TransmitComplete(void)
{
    if(UART_SR_TXEMPTY_Msk == (UART2_REGS->UART_SR & UART_SR_TXEMPTY_Msk))
    {
        return true;
    }
	else
	{
		return false;
	}
}

bool UART2_WriteNotificationEnable(bool isEnabled, bool isPersistent)
{
    bool previousStatus = uart2Obj.isWrNotificationEnabled;

    uart2Obj.isWrNotificationEnabled = isEnabled;

    uart2Obj.isWrNotifyPersistently = isPersistent;

    return previousStatus;
}

void UART2_WriteThresholdSet(uint32_t nBytesThreshold)
{
    if (nBytesThreshold > 0)
    {
        uart2Obj.wrThreshold = nBytesThreshold;
    }
}

void UART2_WriteCallbackRegister( UART_RING_BUFFER_CALLBACK callback, uintptr_t context)
{
    uart2Obj.wrCallback = callback;

    uart2Obj.wrContext = context;
}

static void UART2_ISR_RX_Handler( void )
{
    /* Keep reading until there is a character availabe in the RX FIFO */
    while(UART_SR_RXRDY_Msk == (UART2_REGS->UART_SR& UART_SR_RXRDY_Msk))
    {
        if (UART2_RxPushByte( (uint8_t )(UART2_REGS->UART_RHR& UART_RHR_RXCHR_Msk) ) == true)
        {
            UART2_ReadNotificationSend();
        }
        else
        {
            /* UART RX buffer is full */
        }
    }
}

static void UART2_ISR_TX_Handler( void )
{
    uint8_t wrByte;

    /* Keep writing to the TX FIFO as long as there is space */
    while(UART_SR_TXRDY_Msk == (UART2_REGS->UART_SR & UART_SR_TXRDY_Msk))
    {
        if (UART2_TxPullByte(&wrByte) == true)
        {
            UART2_REGS->UART_THR |= wrByte;

            /* Send notification */
            UART2_WriteNotificationSend();
        }
        else
        {
            /* Nothing to transmit. Disable the data register empty interrupt. */
            UART2_TX_INT_DISABLE();
            break;
        }
    }
}

void UART2_InterruptHandler( void )
{
    /* Error status */
    uint32_t errorStatus = (UART2_REGS->UART_SR & (UART_SR_OVRE_Msk | UART_SR_FRAME_Msk | UART_SR_PARE_Msk));

    if(errorStatus != 0)
    {
        /* Client must call UARTx_ErrorGet() function to clear the errors */

        /* Disable Read, Overrun, Parity and Framing error interrupts */

        UART2_REGS->UART_IDR = (UART_IDR_RXRDY_Msk | UART_IDR_FRAME_Msk | UART_IDR_PARE_Msk | UART_IDR_OVRE_Msk);

        /* UART errors are normally associated with the receiver, hence calling
         * receiver callback */
        if( uart2Obj.rdCallback != NULL )
        {
            uart2Obj.rdCallback(UART_EVENT_READ_ERROR, uart2Obj.rdContext);
        }
    }

    /* Receiver status */
    if(UART_SR_RXRDY_Msk == (UART2_REGS->UART_SR & UART_SR_RXRDY_Msk))
    {
        UART2_ISR_RX_Handler();
    }

    /* Transmitter status */
    if(UART_SR_TXRDY_Msk == (UART2_REGS->UART_SR & UART_SR_TXRDY_Msk))
    {
        UART2_ISR_TX_Handler();
    }

}
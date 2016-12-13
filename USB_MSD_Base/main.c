#include "USB/usb.h"
#include "USB/usb_host_msd.h"
#include "USB/usb_host_msd_scsi.h"
#include "MDD File System/FSIO.h"
#include <stdio.h>
#include <plib.h>

//------------------------------------------------------------------------------
/* 
 * USB_MSD_Base
 * This project contains the minimum code needed to run USB MSD programs and is
 * meant to be built on top of.
 */
//------------------------------------------------------------------------------

// *****************************************************************************
// *****************************************************************************
// Configuration Bits
// *****************************************************************************
// *****************************************************************************

#define _SUPPRESS_PLIB_WARNING 1
//#define EXAMPLE 1
/* Microcontroller MIPs (FCY) */
#define FCY          SYS_FREQ
#define PBCLK        SYS_FREQ/2
#define dTime_ms     PBCLK/2000

#pragma config UPLLEN   = ON            // USB PLL Enabled
#pragma config FPLLMUL  = MUL_20        // PLL Multiplier
#pragma config UPLLIDIV = DIV_2         // USB PLL Input Divider
#pragma config FPLLIDIV = DIV_2         // PLL Input Divider
#pragma config FPLLODIV = DIV_2         // PLL Output Divider
#pragma config FPBDIV   = DIV_1         // Peripheral Clock divisor
#pragma config FWDTEN   = OFF           // Watchdog Timer 
#pragma config WDTPS    = PS1           // Watchdog Timer Postscale
#pragma config FCKSM    = CSDCMD        // Clock Switching & Fail Safe Clock Monitor
#pragma config OSCIOFNC = OFF           // CLKO Enable
#pragma config POSCMOD  = HS            // Primary Oscillator HS = high speed crystal (If using Primary OSC turn to HS)
#pragma config IESO     = OFF           // Internal/External Switch-over
#pragma config FSOSCEN  = OFF           // Secondary Oscillator Enable
#pragma config FNOSC    = PRIPLL        // Oscillator Selection
#pragma config CP       = OFF           // Code Protect
#pragma config BWP      = OFF           // Boot Flash Write Protect
#pragma config PWP      = OFF           // Program Flash Write Protect
#pragma config ICESEL   = ICS_PGx1      // ICE/ICD Comm Channel Select
#pragma config DEBUG    = OFF           // Debugger Disabled for Starter Kit

int main(void)
{ 
    INTEnableSystemMultiVectoredInt();
    //Initialize the stack
    USBInitialize(0);
    while(1)
    {
        //USB stack process function (Call to advance USB state machine)
        USBTasks();
        

    }
    return 0;
}


/****************************************************************************
  Function:
    BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event,
                void *data, DWORD size )

  Summary:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.

  Description:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.  If the application is able to handle the event, it
    returns TRUE.  Otherwise, it returns FALSE.

  Precondition:
    None

  Parameters:
    BYTE address    - Address of device where event occurred
    USB_EVENT event - Identifies the event that occurred
    void *data      - Pointer to event-specific data
    DWORD size      - Size of the event-specific data

  Return Values:
    TRUE    - The event was handled
    FALSE   - The event was not handled

  Remarks:
    The application may also implement an event handling routine if it
    requires knowledge of events.  To do so, it must implement a routine that
    matches this function signature and define the USB_HOST_APP_EVENT_HANDLER
    macro as the name of that function.
  ***************************************************************************/

BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
    switch( event )
    {
        case EVENT_VBUS_REQUEST_POWER:
            // The data pointer points to a byte that represents the amount of power
            // requested in mA, divided by two.  If the device wants too much power,
            // we reject it.
            return TRUE;

        case EVENT_VBUS_RELEASE_POWER:
            // Turn off Vbus power.
            // The PIC24F with the Explorer 16 cannot turn off Vbus through software.

            //This means that the device was removed
            return TRUE;

        case EVENT_HUB_ATTACH:
            return TRUE;

        case EVENT_UNSUPPORTED_DEVICE:
            return TRUE;

        case EVENT_CANNOT_ENUMERATE:
            return TRUE;

        case EVENT_CLIENT_INIT_ERROR:
            return TRUE;

        case EVENT_OUT_OF_MEMORY:
            return TRUE;

        case EVENT_UNSPECIFIED_ERROR:   // This should never be generated.
            return TRUE;

        default:
            break;
    }

    return FALSE;
}

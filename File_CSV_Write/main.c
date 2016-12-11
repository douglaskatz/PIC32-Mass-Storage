#include "USB/usb.h"
#include "USB/usb_host_msd.h"
#include "USB/usb_host_msd_scsi.h"
#include "MDD File System/FSIO.h"
#include <stdio.h>
#include <plib.h>

//------------------------------------------------------------------------------
/* 
 * File_CSV_Write
 * This program creates a CSV file by writing data to a file in a specific format.
 * It involves writing a flash drive multiple times in after connecting it.
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
#pragma config POSCMOD  = HS           // Primary Oscillator HS = high speed crystal (If using Primary OSC turn to HS)
#pragma config IESO     = OFF           // Internal/External Switch-over
#pragma config FSOSCEN  = OFF           // Secondary Oscillator Enable
#pragma config FNOSC    = PRIPLL        // Oscillator Selection
#pragma config CP       = OFF           // Code Protect
#pragma config BWP      = OFF           // Boot Flash Write Protect
#pragma config PWP      = OFF           // Program Flash Write Protect
#pragma config ICESEL   = ICS_PGx1      // ICE/ICD Comm Channel Select
#pragma config DEBUG    = OFF           // Debugger Disabled for Starter Kit

FSFILE * myFile;
volatile BOOL deviceAttached;

/* LED Definitions */
#define _TRIS_LEDGREEN TRISAbits.TRISA0
#define _LEDGREEN LATAbits.LATA0

#define _TRIS_LEDRED TRISBbits.TRISB4
#define _LEDRED LATBbits.LATB4

#define _TRIS_LEDYELLOW TRISAbits.TRISA4
#define _LEDYELLOW LATAbits.LATA4

void csvRow(const char *, const char *, const char *, const char *, const char *, FSFILE *);

int main(void)
{
    // Set up LEDs
    _TRIS_LEDGREEN = 0;
    _TRIS_LEDRED = 0;
    _TRIS_LEDYELLOW = 0;
    _LEDGREEN = 0;
    _LEDRED = 0;
    _LEDYELLOW = 0;
    
    
    int  value;
    value = SYSTEMConfigWaitStatesAndPB( GetSystemClock() );

    // Enable the cache for the best performance
    CheKseg0CacheOn();

    INTEnableSystemMultiVectoredInt();
    
    //UART STUFF
    // specify PPS group, signal, logical pin name
    PPSInput (2, U2RX, RPB8); //Assign U2RX to pin RPB11 -- Physical pin 22 on 28 PDIP
    PPSOutput(4, RPB14, U2TX); //Assign U2TX to pin RPB10 -- Physical pin 21 on 28 PDIP
    
   // init the uart2
    UARTConfigure(UART2, UART_ENABLE_PINS_TX_RX_ONLY);
    UARTSetLineControl(UART2, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);
    UARTSetDataRate(UART2, PBCLK, 9600);
    UARTEnable(UART2, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));

    
    deviceAttached = FALSE;
    
    //Initialize the stack
    USBInitialize(0);
    _LEDYELLOW = 1;
    printf("Standby...\n\r");
    while(1)
    {
        //USB stack process function (Call to advance USB state machine)
        USBTasks();
        
        _LEDRED = 0;
        _LEDGREEN = 0;
        
        //if thumbdrive is plugged in
        if(USBHostMSDSCSIMediaDetect())
        {
            deviceAttached = TRUE;
            _LEDRED = 1;
            _LEDGREEN = 0;

            //now a device is attached
            //See if the device is attached and in the right format
            if(FSInit())
            {
                printf("Writing...\n\r");
                // Open file or create file if none exists in write mode ("w")
                // NOTE: File names must be less than eight characters before the radix
                // NOTE: Extension must also be less than three characters
                myFile = FSfopen("OW.csv","w");
                
                // Writes the file in a CSV format
                csvRow("Hero",     "DPS", "Health", "Armor", "Shield", myFile);
                csvRow("Reinhardt", "75",    "100",   "400",      "0", myFile);
                csvRow("Ana",       "80",    "200",     "0",      "0", myFile);
                csvRow("McCree", "20-70",    "200",     "0",      "0", myFile);
                csvRow("Mei",       "45",    "250",     "0",      "0", myFile); 
                csvRow("Symmetra", "120",    "100",     "0",    "100", myFile); 
                
                // Signal when the write has finished
                printf("Finished Writing");
                printf("\n\r");
                // Always make sure to close the file so that the data gets
                // written to the drive.
                FSfclose(myFile);

                //Just sit here until the device is removed.
                while(deviceAttached == TRUE)
                {
                    USBTasks();
                    _LEDRED = 0;
                    _LEDGREEN = 1;
                }
            }
        }
        _LEDRED = 0;
        _LEDGREEN = 0;
    }
    return 0;
}

// Write a file in CSV format
void csvRow(const char * col0, const char * col1, const char * col2, const char * col3, const char * col4, FSFILE *myFile){
    // Write the data that goes in the first column
    FSfwrite(col0,1,strlen(col0),myFile);
    // Separate data with commas
    FSfwrite(",",1,1,myFile);
    FSfwrite(col1,1,strlen(col1),myFile);
    FSfwrite(",",1,1,myFile);
    FSfwrite(col2,1,strlen(col2),myFile);
    FSfwrite(",",1,1,myFile);
    FSfwrite(col3,1,strlen(col3),myFile);
    FSfwrite(",",1,1,myFile);
    FSfwrite(col4,1,strlen(col4),myFile);
    // End each row with a newline
    FSfwrite("\n",1,1,myFile);
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
    USB_EVENT event - Identifies the event that occured
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
            deviceAttached = FALSE;
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

// HardwareProfile.h

#ifndef _HARDWARE_PROFILE_H_
#define _HARDWARE_PROFILE_H_

#define _SUPPRESS_PLIB_WARNING 1

// Clock Definitions
#define SYS_CLOCK 8000000
#ifndef SYS_CLOCK
    #error "Define SYS_CLOCK (ex. -DSYS_CLOCK=80000000) on compiler command line"
#endif
#define GetSystemClock()            SYS_CLOCK
#define GetPeripheralClock()        SYS_CLOCK
#define GetInstructionClock()

// Calculate the timer values
#define SYS_FREQ                    GetSystemClock()
#define PB_DIV                      1
#define TIMER_PRESCALER             256
#define TOGGLES_PER_SEC             100
#define TIMER_PERIOD                (SYS_FREQ/PB_DIV/TIMER_PRESCALER/TOGGLES_PER_SEC)
#define MILLISECONDS_PER_TICK       (1000/TOGGLES_PER_SEC)


#include <p32xxxx.h>
#include <plib.h>


// Select your MDD File System interface type
// This library currently only supports a single physical interface layer

//#define USE_SD_INTERFACE_WITH_SPI       // SD-SPI.c and .h
//#define USE_CF_INTERFACE_WITH_PMP       // CF-PMP.c and .h
//#define USE_MANUAL_CF_INTERFACE         // CF-Bit transaction.c and .h
#define USE_USB_INTERFACE               // USB host MSD library



/** TRIS ***********************************************************/
#define INPUT_PIN           1
#define OUTPUT_PIN          0

#endif  // _HARDWARE_PROFILE_H_


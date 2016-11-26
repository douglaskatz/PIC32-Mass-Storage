/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/
#define _SUPPRESS_PLIB_WARNING 1
#ifdef __XC32
    #include <xc.h>          /* Defines special funciton registers, CP0 regs  */
#endif

#include <plib.h>            /* Include to use PIC32 peripheral libraries     */
#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include "system.h"

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

/* TODO Initialize User Ports/Peripherals/Project here */

void InitApp(void)
{
    /* Setup analog functionality and port direction */

    /* Initialize peripherals */
}

void delay_ms(unsigned long i){
    unsigned int j;
    j = dTime_ms * i;
    WriteCoreTimer(0);
    while(ReadCoreTimer() < j);
}

int sw1_debounce(){
    int cntr = 0;
    while(SWITCH_1){
        cntr++;
        if(cntr > 200){
            while(SWITCH_1);
            return 1;
        }
    }
    return 0;
}

int sw2_debounce(){
    int cntr = 0;
    while(SWITCH_2){
        cntr++;
        if(cntr > 200){
            while(SWITCH_2);
            return 1;
        }
    }
    return 0;
}
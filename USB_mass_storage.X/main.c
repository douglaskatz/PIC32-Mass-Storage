/******************************************************************************/
/*  Files to Include                                                          */
/******************************************************************************/
#ifdef __XC32
    #include <xc.h>          /* Defines special funciton registers, CP0 regs  */
#endif

#include <plib.h>           /* Include to use PIC32 peripheral libraries      */
#include <stdint.h>         /* For uint32_t definition                        */
#include <stdbool.h>        /* For true/false definition                      */

#include "system.h"         /* System funct/params, like osc/periph config    */
#include "user.h"           /* User funct/params, such as InitApp             */

/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

/* i.e. uint32_t <variable_name>; */

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/
int32_t main(void)
{

#ifndef PIC32_STARTER_KIT
    DDPCONbits.JTAGEN = 0;
#endif
    /* TODO Add user clock/system configuration code if appropriate.  */
    SYSTEMConfig(SYS_FREQ, SYS_CFG_ALL); 

    /* Initialize I/O and Peripherals for application */
    InitApp();

    /*Configure Multivector Interrupt Mode.  Using Single Vector Mode
    is expensive from a timing perspective, so most applications
    should probably not use a Single Vector Mode*/
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);

    /* TODO <INSERT USER APPLICATION CODE HERE> */
    mPORTBSetPinsDigitalIn(BIT_7); //Set Switch 1 to an input
    mPORTBSetPinsDigitalIn(BIT_13); //Set Switch 1 to an input
    
    _TRIS_LEDGREEN = 0;
    _TRIS_LEDRED = 0;
    _LEDGREEN = 0;
    _LEDRED = 1;
    while(1)
    {
        //delay_ms(200);
        if(sw1_debounce()){
            _LEDGREEN ^= 1;
            _LEDRED ^= 1;
            delay_ms(200);
        }
        
        if(sw2_debounce()){
            _LEDGREEN = 1;
            _LEDRED = 1;
            delay_ms(200);
        }
    }
}

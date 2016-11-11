/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

/* TODO Application specific user parameters used in user.c may go here */

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */
#define _TRIS_LEDGREEN TRISAbits.TRISA0
#define _LEDGREEN LATAbits.LATA0

#define _TRIS_LEDRED TRISBbits.TRISB4
#define _LEDRED LATBbits.LATB4

void InitApp(void);         /* I/O and Peripheral Initialization */

void delay_ms(unsigned long i);

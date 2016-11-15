/********************************************************************
 * FileName:		BLOIP.c
 * Dependencies:
 * Company:		Microchip Technology, Inc.
 *
 * Software License Agreement:
 * The software supplied herewith by Microchip Technology Incorporated
 * (the “Company”) for its PICmicro® Microcontroller is intended and
 * supplied to you, the Company’s customer, for use solely and
 * exclusively on Microchip PICmicro Microcontroller products. The
 * software is owned by the Company and/or its supplier, and is
 * protected under applicable copyright laws. All rights are reserved.
 * Any use in violation of the foregoing restrictions may subject the
 * user to criminal sanctions under applicable laws, as well as to
 * civil liability for the breach of the terms and conditions of this
 * license.
 *
 * THIS SOFTWARE IS PROVIDED IN AN “AS IS” CONDITION. NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 * TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 * IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 *********************************************************************
 * File Description:
 *
 * FTP Server
 *
 * Change History:
 * Name				Date            Changes
 * Sean Justice		04/05/06		Initial Version
 ********************************************************************/
#include "bsd_ftp_server\ftp.h"
#include "bsd_bootloader_over_ip\sharedrom.h"
#include "bsd_bootloader_over_ip\bloip.h"
#include "bsd_dhcp_client\dhcp.h"
#include "ex16lcd.h"
#include <plib.h>

PRIVATE BOOL _CheckApplicationFile(void) __attribute__((section("Bootloader")));
PRIVATE BOOL _WriteApplicationFile(void) __attribute__((section("Bootloader")));
PRIVATE BOOL _CheckROMApplication(void) __attribute__((section("Bootloader")));
PRIVATE void _GotoMainApp(void) __attribute__((section("Bootloader")));
PRIVATE void _MonitorApplication(void) __attribute__((section("Bootloader")));
void SetupDefault_IP_MAC() __attribute__((section("Bootloader")));
void InitializeBoard(void) __attribute__((section("Bootloader")));
int main(void) __attribute__((section("Bootloader")));
PRIVATE DWORD _FormProgramCheckSum(BYTE *addr, DWORD size) __attribute__((section("Bootloader")));

//////////////////////////////////////////////////////////////
// Basic board setup functions
void SetupDefault_IP_MAC()
{
	// Initialize default IP and MAC address
	SysIPAddr.Val=TCPIPAddrStrToDword( DEFAULT_IP_ADDR);	
	MAC_StrToBin ( DEFAULT_MAC_ADDR,	SysMACAddr.v );    
}
//////////////////////////////////////////////////////////////
void InitializeBoard(void)
{

}//end InitializeBoard
//////////////////////////////////////////////////////////////
/*********************************************************************
 * Function:       
 *
 * PreCondition:    
 *
 * Input:           
 *
 * Output:          
 *
 * Side Effects:    
 *
 * Overview:        
 *
 * Note:           
 ********************************************************************/
int main(void)
{
	IP_ADDR	curr_ip;

    SYSTEMConfigWaitStatesAndPB(72000000);
    INTEnableSystemMultiVectoredInt();
    
    Ex16LCDInit(36000000);
    
    SetupDefault_IP_MAC();
	InitializeBoard();
	SystemTickInit();
	TCPIPInit();

	Ex16LCDWriteLine(1, "BLOIP v00.00.01");
	Ex16LCDWriteLine(2, "FAT16 Init");
	
	if ( !FAT16Init() )
    {
		Ex16LCDWriteLine(2, "FAT16 Error");
        return -1;
    }

	Ex16LCDWriteLine(2, "Check For App File");
	if(_CheckApplicationFile())
    {
        if(_WriteApplicationFile())
        {

            remove(BLOIP_APP_FILENAME);

            _GotoMainApp();

            return -1;
        }

        remove(BLOIP_APP_FILENAME);
    }

	Ex16LCDWriteLine(2, "Verify App");
	
    if(_CheckROMApplication())
    {
        _GotoMainApp();

        return -1;
    }

	Ex16LCDWriteLine(2, "FTP Init");
    FTPInit();
	DHCPInit();

	curr_ip.Val = 0;
	while(1)
	{

		TCPIPProcess();	

		FTPServer();

        if(FTPGetStage() == SM_FTP_NOT_CONNECTED)
            _MonitorApplication();
            
		if(curr_ip.Val != SysIPAddr.Val)
		{
	        BYTE  ip_addr[17];
	        BYTE  number[4];
	        
	        itoa(SysIPAddr.v[0],number);
	        strcpy(ip_addr, number);
	        strcat(ip_addr, ".");
	        itoa(SysIPAddr.v[1],number);
	        strcat(ip_addr, number);
	        strcat(ip_addr, ".");
	        itoa(SysIPAddr.v[2],number);
	        strcat(ip_addr, number);
	        strcat(ip_addr, ".");
	        itoa(SysIPAddr.v[3],number);
	        strcat(ip_addr, number);
    		
    		Ex16LCDWriteLine(2, ip_addr);
    		
    		curr_ip.Val = SysIPAddr.Val;
			
		}			
	}
}
/*********************************************************************
 * Function:       
 *
 * PreCondition:    
 *
 * Input:           
 *
 * Output:          
 *
 * Side Effects:    
 *
 * Overview:        
 *
 * Note:           
 ********************************************************************/
PRIVATE void _MonitorApplication(void)
{
	if(_CheckApplicationFile())
    {
        if(_WriteApplicationFile())
        {

            remove(BLOIP_APP_FILENAME);

            _GotoMainApp();

        }

        remove(BLOIP_APP_FILENAME);
    }
}
/*********************************************************************
 * Function:       
 *
 * PreCondition:    
 *
 * Input:           
 *
 * Output:          
 *
 * Side Effects:    
 *
 * Overview:        
 *
 * Note:           
 ********************************************************************/
PRIVATE void _GotoMainApp(void)
{
    // stop the interrupts
    mINTDisableSystemMultiVectoredInt();
    
    asm ("nop");

    int (*fp)(void) = (int (*)(void))((void *)BLOIP_APP_START);

    fp();

}
/*********************************************************************
 * Function:       
 *
 * PreCondition:    
 *
 * Input:           
 *
 * Output:          
 *
 * Side Effects:    
 *
 * Overview:        
 *
 * Note:           
 ********************************************************************/
PRIVATE BOOL _CheckApplicationFile(void)
{
    FILE            *bin;
    BIN_FILE_HDR    hdr;
    BIN_FILE_REC    rec;
    DWORD           chksum;
    int             result;

    bin = fopen(BLOIP_APP_FILENAME, "rb");

    if(!bin)
        return FALSE;


    result = fread(&hdr, sizeof(BIN_FILE_HDR), 1, bin);

    if(!result)
    {
        fclose(bin);
        return FALSE;
    }

    chksum = 0xFFFFFFFFL;
    
    while(fread(&rec, sizeof(BIN_FILE_REC), 1, bin))
    {
        WORD    i;
        BYTE    *ptr;

        ptr = (BYTE *)&rec;

        for(i = 0; i < sizeof(BIN_FILE_REC); i++)
            chksum += ptr[i];
    }

    fclose(bin);

    if(chksum != hdr.file_chksum)
    {
        return FALSE;
    }

    return TRUE;
}
/*********************************************************************
 * Function:       
 *
 * PreCondition:    
 *
 * Input:           
 *
 * Output:          
 *
 * Side Effects:    
 *
 * Overview:        
 *
 * Note:           
 ********************************************************************/
PRIVATE BOOL _WriteApplicationFile(void)
{
    FILE                *bin;
    BIN_FILE_REC        rec;
    PROGRAM_ROM_CHKSUM  rom_chksum;

    bin = fopen(BLOIP_APP_FILENAME, "rb");

    if(!bin)
        return FALSE;


    if(fseek(bin, sizeof(BIN_FILE_HDR), SEEK_SET))
    {
        fclose(bin);
        return FALSE;
    }

	asm("di");
	
    // erase the start ROM and everything
    NVMErasePage((void *)BLOIP_APP_ROM_DATA);

    rom_chksum.prgm_len     = 0;

    while(fread(&rec, sizeof(BIN_FILE_REC), 1, bin))
    {
        WORD        i;
        BYTE        *ptr;
        WORD        chksum;

        ptr         = (BYTE *)&rec;
        chksum      = 0xFFFF;

        for(i = 0; i < (sizeof(BIN_FILE_REC) - 2); i++)
        {
            chksum += ptr[i];
        }

        
        if(chksum != rec.chksum)
        {
            fclose(bin);
            return FALSE;
        }

        if((rec.addr >= BLOIP_APP_START) && (rec.addr < BLOIP_APP_END))
            rom_chksum.prgm_len += 512;

        if(!(rec.addr & (BYTE_PAGE_SIZE - 1)))
        {
            NVMErasePage((void *)rec.addr);
        }

        NVMWriteRow((void *)rec.addr, rec.data);

    }
    
    rom_chksum.prgm_chksum = _FormProgramCheckSum((BYTE *)BLOIP_APP_START, rom_chksum.prgm_len);

    {
        BYTE    i;
        BYTE    *ptr;

        ptr = (BYTE *)&rom_chksum;

		rom_chksum.prgm_rom_chksum = 0;
	
        for(i = 0; i < (sizeof(PROGRAM_ROM_CHKSUM) - 2); i++)
            rom_chksum.prgm_rom_chksum += ptr[i];
            
		rom_chksum.prgm_rom_chksum ^= 0xFFFF;
    }
            

    // TODO place the checksum data here
	memset(rec.data, 0xFF, 512);
	memcpy(rec.data, (void *)&rom_chksum, sizeof(PROGRAM_ROM_CHKSUM));
	
	NVMWriteRow((void *)BLOIP_APP_ROM_DATA, rec.data);

    fclose(bin);
    return TRUE;
}
/*********************************************************************
 * Function:       
 *
 * PreCondition:    
 *
 * Input:           
 *
 * Output:          
 *
 * Side Effects:    
 *
 * Overview:        
 *
 * Note:           
 ********************************************************************/
PRIVATE BOOL _CheckROMApplication(void)
{
    PROGRAM_ROM_CHKSUM  rom_chksum;
    DWORD               chksum;
    DWORD               i;
	BYTE				*app;
    
    memcpy((void *)&rom_chksum, (void *)BLOIP_APP_ROM_DATA, sizeof(PROGRAM_ROM_CHKSUM));

        
    app = (BYTE *)&rom_chksum;
    chksum = 0;

    for(i = 0; i < (sizeof(PROGRAM_ROM_CHKSUM) - 2); i++)
        chksum += app[i];
          
	chksum ^= 0xFFFF;            

    if((WORD)chksum != rom_chksum.prgm_rom_chksum)
        return FALSE;

    chksum = _FormProgramCheckSum((BYTE *)BLOIP_APP_START, rom_chksum.prgm_len);

    if(chksum != rom_chksum.prgm_chksum)
        return FALSE;

    return TRUE;

}
/*********************************************************************
 * Function:       
 *
 * PreCondition:    
 *
 * Input:           
 *
 * Output:          
 *
 * Side Effects:    
 *
 * Overview:        
 *
 * Note:           
 ********************************************************************/
PRIVATE DWORD _FormProgramCheckSum(BYTE *addr, DWORD size)
{
    DWORD   chksum;
    
    chksum = 0xFFFFFFFF;

    while(size)
    {
        chksum += (DWORD)*addr++;
        size--;
    }

    chksum ^= 0xAA559966;

    return chksum;
}


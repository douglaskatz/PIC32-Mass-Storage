/********************************************************************
 * FileName:		SharedFuncPtr.c
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
 * Change History:
 * Name				Date            Changes
 * Sean Justice		04/21/06		Initial Version
 ********************************************************************/
#include "generic.h"
#include "bsd_ftp_server\ftp.h"
#include "ex16lcd.h"

__attribute__((section("SharedFunc"))) void * const SharedFunctionTbl[] =
{
    FAT16Init,
    fopen,
    fclose,
    remove,
    fread,
    fwrite,
    fseek,
    ftell,
    rewind,
    CreateDirectory,
    ChangeDirectory,
    GetDirectoryName,
    EraseDirectory,
    feof,
    socket,
    bind,
    listen,
    accept,
    connect,
    sendto,
    send,
    recvfrom,
    recv,
    setsockopt,
    closesocket,
    TCPIPInit,
    TCPIPProcess,
    FTPInit,
    FTPServer,
    FTPGetUser,
    FTPGetStage,
    SystemTickInit,
    SystemTickGet,
    Ex16LCDInit,
    Ex16LCDWriteLine
};


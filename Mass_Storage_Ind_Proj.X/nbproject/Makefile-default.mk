#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Mass_Storage_Ind_Proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Mass_Storage_Ind_Proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED="../Microchip/MDD File System/FSIO.c" ../Microchip/USB/usb_host.c "../Microchip/USB/MSD Host Driver/usb_host_msd.c" "../Microchip/USB/MSD Host Driver/usb_host_msd_scsi.c" ../usb_config.c main.c system.c user.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2054364014/FSIO.o ${OBJECTDIR}/_ext/343710134/usb_host.o ${OBJECTDIR}/_ext/131683717/usb_host_msd.o ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o ${OBJECTDIR}/_ext/1472/usb_config.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/user.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2054364014/FSIO.o.d ${OBJECTDIR}/_ext/343710134/usb_host.o.d ${OBJECTDIR}/_ext/131683717/usb_host_msd.o.d ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o.d ${OBJECTDIR}/_ext/1472/usb_config.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/system.o.d ${OBJECTDIR}/user.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2054364014/FSIO.o ${OBJECTDIR}/_ext/343710134/usb_host.o ${OBJECTDIR}/_ext/131683717/usb_host_msd.o ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o ${OBJECTDIR}/_ext/1472/usb_config.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/user.o

# Source Files
SOURCEFILES=../Microchip/MDD File System/FSIO.c ../Microchip/USB/usb_host.c ../Microchip/USB/MSD Host Driver/usb_host_msd.c ../Microchip/USB/MSD Host Driver/usb_host_msd_scsi.c ../usb_config.c main.c system.c user.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Mass_Storage_Ind_Proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX250F128B
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2054364014/FSIO.o: ../Microchip/MDD\ File\ System/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2054364014" 
	@${RM} ${OBJECTDIR}/_ext/2054364014/FSIO.o.d 
	@${RM} ${OBJECTDIR}/_ext/2054364014/FSIO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2054364014/FSIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/2054364014/FSIO.o.d" -o ${OBJECTDIR}/_ext/2054364014/FSIO.o "../Microchip/MDD File System/FSIO.c"   
	
${OBJECTDIR}/_ext/343710134/usb_host.o: ../Microchip/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/343710134" 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/343710134/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/343710134/usb_host.o.d" -o ${OBJECTDIR}/_ext/343710134/usb_host.o ../Microchip/USB/usb_host.c   
	
${OBJECTDIR}/_ext/131683717/usb_host_msd.o: ../Microchip/USB/MSD\ Host\ Driver/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/131683717" 
	@${RM} ${OBJECTDIR}/_ext/131683717/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/131683717/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/131683717/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/131683717/usb_host_msd.o.d" -o ${OBJECTDIR}/_ext/131683717/usb_host_msd.o "../Microchip/USB/MSD Host Driver/usb_host_msd.c"   
	
${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o: ../Microchip/USB/MSD\ Host\ Driver/usb_host_msd_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/131683717" 
	@${RM} ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o "../Microchip/USB/MSD Host Driver/usb_host_msd_scsi.c"   
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/1472/usb_config.o.d" -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c   
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/system.o.d" -o ${OBJECTDIR}/system.o system.c   
	
${OBJECTDIR}/user.o: user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	@${FIXDEPS} "${OBJECTDIR}/user.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/user.o.d" -o ${OBJECTDIR}/user.o user.c   
	
else
${OBJECTDIR}/_ext/2054364014/FSIO.o: ../Microchip/MDD\ File\ System/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2054364014" 
	@${RM} ${OBJECTDIR}/_ext/2054364014/FSIO.o.d 
	@${RM} ${OBJECTDIR}/_ext/2054364014/FSIO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2054364014/FSIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/2054364014/FSIO.o.d" -o ${OBJECTDIR}/_ext/2054364014/FSIO.o "../Microchip/MDD File System/FSIO.c"   
	
${OBJECTDIR}/_ext/343710134/usb_host.o: ../Microchip/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/343710134" 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/343710134/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/343710134/usb_host.o.d" -o ${OBJECTDIR}/_ext/343710134/usb_host.o ../Microchip/USB/usb_host.c   
	
${OBJECTDIR}/_ext/131683717/usb_host_msd.o: ../Microchip/USB/MSD\ Host\ Driver/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/131683717" 
	@${RM} ${OBJECTDIR}/_ext/131683717/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/131683717/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/131683717/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/131683717/usb_host_msd.o.d" -o ${OBJECTDIR}/_ext/131683717/usb_host_msd.o "../Microchip/USB/MSD Host Driver/usb_host_msd.c"   
	
${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o: ../Microchip/USB/MSD\ Host\ Driver/usb_host_msd_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/131683717" 
	@${RM} ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/_ext/131683717/usb_host_msd_scsi.o "../Microchip/USB/MSD Host Driver/usb_host_msd_scsi.c"   
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/_ext/1472/usb_config.o.d" -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c   
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/system.o.d" -o ${OBJECTDIR}/system.o system.c   
	
${OBJECTDIR}/user.o: user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	@${FIXDEPS} "${OBJECTDIR}/user.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DPIC32_STARTER_KIT -DSYS_CLOCK=80000000 -I".." -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../../Microchip/Include/USB" -I"../../../Microchip/USB" -I"." -I"../Microchip" -I"../Microchip/MDD File System" -I"../Microchip/USB" -I"../Microchip/Include" -I"../Microchip/Common" -I"../Microchip/USB/MSD Host Driver" -I"../Microchip/Include/MDD File System" -MMD -MF "${OBJECTDIR}/user.o.d" -o ${OBJECTDIR}/user.o user.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Mass_Storage_Ind_Proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Mass_Storage_Ind_Proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}           -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=8192,-L"../../../MPLAB C32 Suite/lib",-L"../../../MPLAB C32 Suite/pic32mx/lib",-L".",-Map="${DISTDIR}/USB_Host_-_MSD_-_Simple_Demo_.X.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Mass_Storage_Ind_Proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Mass_Storage_Ind_Proj.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=8192,-L"../../../MPLAB C32 Suite/lib",-L"../../../MPLAB C32 Suite/pic32mx/lib",-L".",-Map="${DISTDIR}/USB_Host_-_MSD_-_Simple_Demo_.X.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Mass_Storage_Ind_Proj.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

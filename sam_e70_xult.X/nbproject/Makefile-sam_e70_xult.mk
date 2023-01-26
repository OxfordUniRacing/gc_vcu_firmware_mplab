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
ifeq "$(wildcard nbproject/Makefile-local-sam_e70_xult.mk)" "nbproject/Makefile-local-sam_e70_xult.mk"
include nbproject/Makefile-local-sam_e70_xult.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sam_e70_xult
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/sam_e70_xult/bsp/bsp.c ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c ../src/config/sam_e70_xult/stdio/xc32_monitor.c ../src/config/sam_e70_xult/system/cache/sys_cache.c ../src/config/sam_e70_xult/system/console/src/sys_console.c ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c ../src/config/sam_e70_xult/system/debug/src/sys_debug.c ../src/config/sam_e70_xult/system/int/src/sys_int.c ../src/config/sam_e70_xult/initialization.c ../src/config/sam_e70_xult/interrupts.c ../src/config/sam_e70_xult/exceptions.c ../src/config/sam_e70_xult/startup_xc32.c ../src/config/sam_e70_xult/libc_syscalls.c ../src/config/sam_e70_xult/tasks.c ../src/main.c ../src/app.c ../src/timer.c ../src/uart0.c ../src/inverter.c ../src/can.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/917764137/bsp.o ${OBJECTDIR}/_ext/1639147296/plib_afec0.o ${OBJECTDIR}/_ext/1639147296/plib_afec1.o ${OBJECTDIR}/_ext/1055500827/plib_clk.o ${OBJECTDIR}/_ext/1055499099/plib_efc.o ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o ${OBJECTDIR}/_ext/1639550079/plib_nvic.o ${OBJECTDIR}/_ext/1055488423/plib_pio.o ${OBJECTDIR}/_ext/865331892/plib_tc0.o ${OBJECTDIR}/_ext/1639738731/plib_uart2.o ${OBJECTDIR}/_ext/1639738731/plib_uart1.o ${OBJECTDIR}/_ext/707186936/plib_usart1.o ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o ${OBJECTDIR}/_ext/876653320/sys_cache.o ${OBJECTDIR}/_ext/1953779166/sys_console.o ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o ${OBJECTDIR}/_ext/1763620194/sys_debug.o ${OBJECTDIR}/_ext/766002106/sys_int.o ${OBJECTDIR}/_ext/1728594169/initialization.o ${OBJECTDIR}/_ext/1728594169/interrupts.o ${OBJECTDIR}/_ext/1728594169/exceptions.o ${OBJECTDIR}/_ext/1728594169/startup_xc32.o ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o ${OBJECTDIR}/_ext/1728594169/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/timer.o ${OBJECTDIR}/_ext/1360937237/uart0.o ${OBJECTDIR}/_ext/1360937237/inverter.o ${OBJECTDIR}/_ext/1360937237/can.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/917764137/bsp.o.d ${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d ${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d ${OBJECTDIR}/_ext/1055500827/plib_clk.o.d ${OBJECTDIR}/_ext/1055499099/plib_efc.o.d ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d ${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d ${OBJECTDIR}/_ext/1055488423/plib_pio.o.d ${OBJECTDIR}/_ext/865331892/plib_tc0.o.d ${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d ${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d ${OBJECTDIR}/_ext/707186936/plib_usart1.o.d ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d ${OBJECTDIR}/_ext/876653320/sys_cache.o.d ${OBJECTDIR}/_ext/1953779166/sys_console.o.d ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d ${OBJECTDIR}/_ext/1763620194/sys_debug.o.d ${OBJECTDIR}/_ext/766002106/sys_int.o.d ${OBJECTDIR}/_ext/1728594169/initialization.o.d ${OBJECTDIR}/_ext/1728594169/interrupts.o.d ${OBJECTDIR}/_ext/1728594169/exceptions.o.d ${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d ${OBJECTDIR}/_ext/1728594169/tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/timer.o.d ${OBJECTDIR}/_ext/1360937237/uart0.o.d ${OBJECTDIR}/_ext/1360937237/inverter.o.d ${OBJECTDIR}/_ext/1360937237/can.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/917764137/bsp.o ${OBJECTDIR}/_ext/1639147296/plib_afec0.o ${OBJECTDIR}/_ext/1639147296/plib_afec1.o ${OBJECTDIR}/_ext/1055500827/plib_clk.o ${OBJECTDIR}/_ext/1055499099/plib_efc.o ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o ${OBJECTDIR}/_ext/1639550079/plib_nvic.o ${OBJECTDIR}/_ext/1055488423/plib_pio.o ${OBJECTDIR}/_ext/865331892/plib_tc0.o ${OBJECTDIR}/_ext/1639738731/plib_uart2.o ${OBJECTDIR}/_ext/1639738731/plib_uart1.o ${OBJECTDIR}/_ext/707186936/plib_usart1.o ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o ${OBJECTDIR}/_ext/876653320/sys_cache.o ${OBJECTDIR}/_ext/1953779166/sys_console.o ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o ${OBJECTDIR}/_ext/1763620194/sys_debug.o ${OBJECTDIR}/_ext/766002106/sys_int.o ${OBJECTDIR}/_ext/1728594169/initialization.o ${OBJECTDIR}/_ext/1728594169/interrupts.o ${OBJECTDIR}/_ext/1728594169/exceptions.o ${OBJECTDIR}/_ext/1728594169/startup_xc32.o ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o ${OBJECTDIR}/_ext/1728594169/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/timer.o ${OBJECTDIR}/_ext/1360937237/uart0.o ${OBJECTDIR}/_ext/1360937237/inverter.o ${OBJECTDIR}/_ext/1360937237/can.o

# Source Files
SOURCEFILES=../src/config/sam_e70_xult/bsp/bsp.c ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c ../src/config/sam_e70_xult/stdio/xc32_monitor.c ../src/config/sam_e70_xult/system/cache/sys_cache.c ../src/config/sam_e70_xult/system/console/src/sys_console.c ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c ../src/config/sam_e70_xult/system/debug/src/sys_debug.c ../src/config/sam_e70_xult/system/int/src/sys_int.c ../src/config/sam_e70_xult/initialization.c ../src/config/sam_e70_xult/interrupts.c ../src/config/sam_e70_xult/exceptions.c ../src/config/sam_e70_xult/startup_xc32.c ../src/config/sam_e70_xult/libc_syscalls.c ../src/config/sam_e70_xult/tasks.c ../src/main.c ../src/app.c ../src/timer.c ../src/uart0.c ../src/inverter.c ../src/can.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



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
	${MAKE}  -f nbproject/Makefile-sam_e70_xult.mk ${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAME70Q21B
MP_LINKER_FILE_OPTION=,--script="..\src\config\sam_e70_xult\ATSAME70Q21B.ld"
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
${OBJECTDIR}/_ext/917764137/bsp.o: ../src/config/sam_e70_xult/bsp/bsp.c  .generated_files/flags/sam_e70_xult/bf0f49db5823404b19d472134abbdb8a30420b15 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/917764137" 
	@${RM} ${OBJECTDIR}/_ext/917764137/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/917764137/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/917764137/bsp.o.d" -o ${OBJECTDIR}/_ext/917764137/bsp.o ../src/config/sam_e70_xult/bsp/bsp.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639147296/plib_afec0.o: ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c  .generated_files/flags/sam_e70_xult/3ca52da80ea00c80442df4749a881c083402bba3 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639147296" 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d" -o ${OBJECTDIR}/_ext/1639147296/plib_afec0.o ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639147296/plib_afec1.o: ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c  .generated_files/flags/sam_e70_xult/76b584de9b213b4c8ace03acca43d0f6911f53bc .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639147296" 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d" -o ${OBJECTDIR}/_ext/1639147296/plib_afec1.o ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055500827/plib_clk.o: ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c  .generated_files/flags/sam_e70_xult/d2b4e5c67b9f25f918449fcf9592560bd2320e33 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055500827" 
	@${RM} ${OBJECTDIR}/_ext/1055500827/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055500827/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055500827/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1055500827/plib_clk.o ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055499099/plib_efc.o: ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c  .generated_files/flags/sam_e70_xult/d372661c89e10e456a513a40b2d793434008584c .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055499099" 
	@${RM} ${OBJECTDIR}/_ext/1055499099/plib_efc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055499099/plib_efc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055499099/plib_efc.o.d" -o ${OBJECTDIR}/_ext/1055499099/plib_efc.o ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639501792/plib_mcan0.o: ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c  .generated_files/flags/sam_e70_xult/61de581b1e7044958651e85121fa0a5642cab69c .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639501792" 
	@${RM} ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d" -o ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639550079/plib_nvic.o: ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e70_xult/88e3d4cc9bc8cbd238385711b055ddb403f6db47 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639550079" 
	@${RM} ${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639550079/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1639550079/plib_nvic.o ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055488423/plib_pio.o: ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c  .generated_files/flags/sam_e70_xult/5c7a65a78a8008bb7176f1e165a90f2b12da5f45 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055488423" 
	@${RM} ${OBJECTDIR}/_ext/1055488423/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055488423/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055488423/plib_pio.o.d" -o ${OBJECTDIR}/_ext/1055488423/plib_pio.o ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/865331892/plib_tc0.o: ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c  .generated_files/flags/sam_e70_xult/d65fe922d51dc4e2ece13e4cb62198f853453207 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/865331892" 
	@${RM} ${OBJECTDIR}/_ext/865331892/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/865331892/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/865331892/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/865331892/plib_tc0.o ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639738731/plib_uart2.o: ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c  .generated_files/flags/sam_e70_xult/b0f596faf8d45e61e02486676f2271d1a3260b5e .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639738731" 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/1639738731/plib_uart2.o ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639738731/plib_uart1.o: ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c  .generated_files/flags/sam_e70_xult/45d3432f3ed789be79844922738bb218ab530b8e .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639738731" 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1639738731/plib_uart1.o ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/707186936/plib_usart1.o: ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c  .generated_files/flags/sam_e70_xult/23a08cfa9da7cc9521e6a89f51643becdcc77986 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/707186936" 
	@${RM} ${OBJECTDIR}/_ext/707186936/plib_usart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/707186936/plib_usart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/707186936/plib_usart1.o.d" -o ${OBJECTDIR}/_ext/707186936/plib_usart1.o ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1518761459/xc32_monitor.o: ../src/config/sam_e70_xult/stdio/xc32_monitor.c  .generated_files/flags/sam_e70_xult/4c8f66da1e34aa99ef2d34b403058e80a0f28b26 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1518761459" 
	@${RM} ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o ../src/config/sam_e70_xult/stdio/xc32_monitor.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/876653320/sys_cache.o: ../src/config/sam_e70_xult/system/cache/sys_cache.c  .generated_files/flags/sam_e70_xult/877573d1228f4e9e9fda6babd84aa10a139b4012 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/876653320" 
	@${RM} ${OBJECTDIR}/_ext/876653320/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/876653320/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/876653320/sys_cache.o.d" -o ${OBJECTDIR}/_ext/876653320/sys_cache.o ../src/config/sam_e70_xult/system/cache/sys_cache.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1953779166/sys_console.o: ../src/config/sam_e70_xult/system/console/src/sys_console.c  .generated_files/flags/sam_e70_xult/e8f402efa32465707d5b693e59a1ffa56a120b74 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1953779166" 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1953779166/sys_console.o.d" -o ${OBJECTDIR}/_ext/1953779166/sys_console.o ../src/config/sam_e70_xult/system/console/src/sys_console.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1953779166/sys_console_uart.o: ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c  .generated_files/flags/sam_e70_xult/de0feafa38a4971f1a1bdd2a8c69980a362ce46d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1953779166" 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1763620194/sys_debug.o: ../src/config/sam_e70_xult/system/debug/src/sys_debug.c  .generated_files/flags/sam_e70_xult/bd6a2ddc98153ab22cff0aac1021f053ceb923ce .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1763620194" 
	@${RM} ${OBJECTDIR}/_ext/1763620194/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1763620194/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1763620194/sys_debug.o.d" -o ${OBJECTDIR}/_ext/1763620194/sys_debug.o ../src/config/sam_e70_xult/system/debug/src/sys_debug.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/766002106/sys_int.o: ../src/config/sam_e70_xult/system/int/src/sys_int.c  .generated_files/flags/sam_e70_xult/3de62a6bc651a3ef06337a1c01e7a5c833bd2c37 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/766002106" 
	@${RM} ${OBJECTDIR}/_ext/766002106/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/766002106/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/766002106/sys_int.o.d" -o ${OBJECTDIR}/_ext/766002106/sys_int.o ../src/config/sam_e70_xult/system/int/src/sys_int.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/initialization.o: ../src/config/sam_e70_xult/initialization.c  .generated_files/flags/sam_e70_xult/7f0ab2f12db00615f757a899b7a7b6a17acd0ed2 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/initialization.o.d" -o ${OBJECTDIR}/_ext/1728594169/initialization.o ../src/config/sam_e70_xult/initialization.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/interrupts.o: ../src/config/sam_e70_xult/interrupts.c  .generated_files/flags/sam_e70_xult/72d76a355c8ef3a18935fc950478642aae9c9cea .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/interrupts.o.d" -o ${OBJECTDIR}/_ext/1728594169/interrupts.o ../src/config/sam_e70_xult/interrupts.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/exceptions.o: ../src/config/sam_e70_xult/exceptions.c  .generated_files/flags/sam_e70_xult/2dd6972c448048edffb81d0134d9cbb26eae5a7 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/exceptions.o.d" -o ${OBJECTDIR}/_ext/1728594169/exceptions.o ../src/config/sam_e70_xult/exceptions.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/startup_xc32.o: ../src/config/sam_e70_xult/startup_xc32.c  .generated_files/flags/sam_e70_xult/bc5ac3b901cf5031dd4ba8dc31dac6a94205f459 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1728594169/startup_xc32.o ../src/config/sam_e70_xult/startup_xc32.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/libc_syscalls.o: ../src/config/sam_e70_xult/libc_syscalls.c  .generated_files/flags/sam_e70_xult/aa8953ac45956abed8836c75a299eed02e915d9d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o ../src/config/sam_e70_xult/libc_syscalls.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/tasks.o: ../src/config/sam_e70_xult/tasks.c  .generated_files/flags/sam_e70_xult/b06d477c07ef0d39e11dae1c16278cbb754d47e5 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/tasks.o.d" -o ${OBJECTDIR}/_ext/1728594169/tasks.o ../src/config/sam_e70_xult/tasks.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/sam_e70_xult/a6f391764119fb0493bc930c60812367e5a99f12 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/sam_e70_xult/6becfcae5b1045171a6474e8f328b0afabfbf4ed .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/timer.o: ../src/timer.c  .generated_files/flags/sam_e70_xult/feb0575f86a74d16e923eac86c343728fd09a1b3 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/timer.o.d" -o ${OBJECTDIR}/_ext/1360937237/timer.o ../src/timer.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/uart0.o: ../src/uart0.c  .generated_files/flags/sam_e70_xult/361425a658b8a54151e886b8024e09142c1493f8 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/uart0.o.d" -o ${OBJECTDIR}/_ext/1360937237/uart0.o ../src/uart0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/inverter.o: ../src/inverter.c  .generated_files/flags/sam_e70_xult/225a46140cffb99cce73e5e770a1075921e03b6d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/inverter.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/inverter.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/inverter.o.d" -o ${OBJECTDIR}/_ext/1360937237/inverter.o ../src/inverter.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/can.o: ../src/can.c  .generated_files/flags/sam_e70_xult/b34476872b8f0613ac9266027afeefa255f6667b .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/can.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/can.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/can.o.d" -o ${OBJECTDIR}/_ext/1360937237/can.o ../src/can.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/917764137/bsp.o: ../src/config/sam_e70_xult/bsp/bsp.c  .generated_files/flags/sam_e70_xult/642651a76be8a20cacd1a09af118fa67da623405 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/917764137" 
	@${RM} ${OBJECTDIR}/_ext/917764137/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/917764137/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/917764137/bsp.o.d" -o ${OBJECTDIR}/_ext/917764137/bsp.o ../src/config/sam_e70_xult/bsp/bsp.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639147296/plib_afec0.o: ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c  .generated_files/flags/sam_e70_xult/958cc7c475cd9d6a63d6c400750f62c76d16ed05 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639147296" 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d" -o ${OBJECTDIR}/_ext/1639147296/plib_afec0.o ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639147296/plib_afec1.o: ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c  .generated_files/flags/sam_e70_xult/68faecf8a21c18835cecc2f7dcfa428593a169cf .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639147296" 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d" -o ${OBJECTDIR}/_ext/1639147296/plib_afec1.o ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055500827/plib_clk.o: ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c  .generated_files/flags/sam_e70_xult/12cf07302f39aebe292edbd39ffcf7716bc1c89d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055500827" 
	@${RM} ${OBJECTDIR}/_ext/1055500827/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055500827/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055500827/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1055500827/plib_clk.o ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055499099/plib_efc.o: ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c  .generated_files/flags/sam_e70_xult/7882b696203633808199cee6024fb5730d030031 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055499099" 
	@${RM} ${OBJECTDIR}/_ext/1055499099/plib_efc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055499099/plib_efc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055499099/plib_efc.o.d" -o ${OBJECTDIR}/_ext/1055499099/plib_efc.o ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639501792/plib_mcan0.o: ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c  .generated_files/flags/sam_e70_xult/f1e139cf69058d683f9284faf041ac33a7784b0f .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639501792" 
	@${RM} ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d" -o ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639550079/plib_nvic.o: ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e70_xult/1f5ca42d9a971bc9f16ce60983a45e985ae25229 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639550079" 
	@${RM} ${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639550079/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1639550079/plib_nvic.o ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055488423/plib_pio.o: ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c  .generated_files/flags/sam_e70_xult/34eaeca68a29d0454d2b7baa6ce53ae1f979d6a2 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055488423" 
	@${RM} ${OBJECTDIR}/_ext/1055488423/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055488423/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055488423/plib_pio.o.d" -o ${OBJECTDIR}/_ext/1055488423/plib_pio.o ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/865331892/plib_tc0.o: ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c  .generated_files/flags/sam_e70_xult/427c32bc6d98390cbfb23bffb127c013c3cc7eb3 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/865331892" 
	@${RM} ${OBJECTDIR}/_ext/865331892/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/865331892/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/865331892/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/865331892/plib_tc0.o ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639738731/plib_uart2.o: ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c  .generated_files/flags/sam_e70_xult/af83a8eeaed57062b39a494b2a783a12f60433b0 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639738731" 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/1639738731/plib_uart2.o ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639738731/plib_uart1.o: ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c  .generated_files/flags/sam_e70_xult/2511156ac616cbb68f72142d3317d1861aef6d29 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639738731" 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1639738731/plib_uart1.o ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/707186936/plib_usart1.o: ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c  .generated_files/flags/sam_e70_xult/d0bc9d1bcc7b412971f031f89a0a0e93a3db9d5b .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/707186936" 
	@${RM} ${OBJECTDIR}/_ext/707186936/plib_usart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/707186936/plib_usart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/707186936/plib_usart1.o.d" -o ${OBJECTDIR}/_ext/707186936/plib_usart1.o ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1518761459/xc32_monitor.o: ../src/config/sam_e70_xult/stdio/xc32_monitor.c  .generated_files/flags/sam_e70_xult/a63fdd010675e1284fb32f58c71ddeb7d4bb21a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1518761459" 
	@${RM} ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o ../src/config/sam_e70_xult/stdio/xc32_monitor.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/876653320/sys_cache.o: ../src/config/sam_e70_xult/system/cache/sys_cache.c  .generated_files/flags/sam_e70_xult/61437cf473295ed671d0af4dbb64c24d9acbd681 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/876653320" 
	@${RM} ${OBJECTDIR}/_ext/876653320/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/876653320/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/876653320/sys_cache.o.d" -o ${OBJECTDIR}/_ext/876653320/sys_cache.o ../src/config/sam_e70_xult/system/cache/sys_cache.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1953779166/sys_console.o: ../src/config/sam_e70_xult/system/console/src/sys_console.c  .generated_files/flags/sam_e70_xult/c72e5890dd6df4fe5cb6606a1e7b2636d9c54e6c .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1953779166" 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1953779166/sys_console.o.d" -o ${OBJECTDIR}/_ext/1953779166/sys_console.o ../src/config/sam_e70_xult/system/console/src/sys_console.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1953779166/sys_console_uart.o: ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c  .generated_files/flags/sam_e70_xult/7e135136e6a0c375877c04331f0278342d03a59b .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1953779166" 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1763620194/sys_debug.o: ../src/config/sam_e70_xult/system/debug/src/sys_debug.c  .generated_files/flags/sam_e70_xult/876ae029258e3df41a500c9f7589814ddb409f4b .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1763620194" 
	@${RM} ${OBJECTDIR}/_ext/1763620194/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1763620194/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1763620194/sys_debug.o.d" -o ${OBJECTDIR}/_ext/1763620194/sys_debug.o ../src/config/sam_e70_xult/system/debug/src/sys_debug.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/766002106/sys_int.o: ../src/config/sam_e70_xult/system/int/src/sys_int.c  .generated_files/flags/sam_e70_xult/e26eb8a0ed91e5dc4050ac8a55be14bfcc26f1ed .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/766002106" 
	@${RM} ${OBJECTDIR}/_ext/766002106/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/766002106/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/766002106/sys_int.o.d" -o ${OBJECTDIR}/_ext/766002106/sys_int.o ../src/config/sam_e70_xult/system/int/src/sys_int.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/initialization.o: ../src/config/sam_e70_xult/initialization.c  .generated_files/flags/sam_e70_xult/3537ac4741200404d4b066ed0b2845e86d8123ed .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/initialization.o.d" -o ${OBJECTDIR}/_ext/1728594169/initialization.o ../src/config/sam_e70_xult/initialization.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/interrupts.o: ../src/config/sam_e70_xult/interrupts.c  .generated_files/flags/sam_e70_xult/e8917284fd85db939d015604c1fc6b34e3396d0a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/interrupts.o.d" -o ${OBJECTDIR}/_ext/1728594169/interrupts.o ../src/config/sam_e70_xult/interrupts.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/exceptions.o: ../src/config/sam_e70_xult/exceptions.c  .generated_files/flags/sam_e70_xult/5bd886786197845a00e734f488edb2f0cb293f5a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/exceptions.o.d" -o ${OBJECTDIR}/_ext/1728594169/exceptions.o ../src/config/sam_e70_xult/exceptions.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/startup_xc32.o: ../src/config/sam_e70_xult/startup_xc32.c  .generated_files/flags/sam_e70_xult/5a052b8d0e8dc01db6759ae3706f49acb966415c .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1728594169/startup_xc32.o ../src/config/sam_e70_xult/startup_xc32.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/libc_syscalls.o: ../src/config/sam_e70_xult/libc_syscalls.c  .generated_files/flags/sam_e70_xult/1a6f5d49a2e9689fae7f38292a5a3c1fa4c14a61 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o ../src/config/sam_e70_xult/libc_syscalls.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/tasks.o: ../src/config/sam_e70_xult/tasks.c  .generated_files/flags/sam_e70_xult/c63ed4e0357ed28c575d57b649ae9ac7e87175bf .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/tasks.o.d" -o ${OBJECTDIR}/_ext/1728594169/tasks.o ../src/config/sam_e70_xult/tasks.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/sam_e70_xult/6233278cf64e705a2c56010949e3cb8830e8e84f .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/sam_e70_xult/f314a0615765fa6fc5f431a8b5ea209fa9929b1a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/timer.o: ../src/timer.c  .generated_files/flags/sam_e70_xult/171a35adb863ef7c272d04e26f1836ed3500721a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/timer.o.d" -o ${OBJECTDIR}/_ext/1360937237/timer.o ../src/timer.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/uart0.o: ../src/uart0.c  .generated_files/flags/sam_e70_xult/60be242d377db330b3d37e80ec166a7fc244e7ff .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/uart0.o.d" -o ${OBJECTDIR}/_ext/1360937237/uart0.o ../src/uart0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/inverter.o: ../src/inverter.c  .generated_files/flags/sam_e70_xult/6cff08c428e90780f3b23e193159f8b44778fea4 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/inverter.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/inverter.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/inverter.o.d" -o ${OBJECTDIR}/_ext/1360937237/inverter.o ../src/inverter.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/can.o: ../src/can.c  .generated_files/flags/sam_e70_xult/c29c601e52abfe7a5d0ffdd15e501e3243e82cb2 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/can.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/can.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/can.o.d" -o ${OBJECTDIR}/_ext/1360937237/can.o ../src/can.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-error -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/sam_e70_xult/ATSAME70Q21B.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_e70_xult=$(CND_CONF)    -Wno-error $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/same70b"
	
else
${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/sam_e70_xult/ATSAME70Q21B.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_e70_xult=$(CND_CONF)    -Wno-error $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/same70b"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

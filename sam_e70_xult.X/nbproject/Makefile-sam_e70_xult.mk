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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/sam_e70_xult/bsp/bsp.c ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c ../src/config/sam_e70_xult/stdio/xc32_monitor.c ../src/config/sam_e70_xult/system/cache/sys_cache.c ../src/config/sam_e70_xult/system/console/src/sys_console.c ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c ../src/config/sam_e70_xult/system/debug/src/sys_debug.c ../src/config/sam_e70_xult/system/int/src/sys_int.c ../src/config/sam_e70_xult/initialization.c ../src/config/sam_e70_xult/interrupts.c ../src/config/sam_e70_xult/exceptions.c ../src/config/sam_e70_xult/startup_xc32.c ../src/config/sam_e70_xult/libc_syscalls.c ../src/config/sam_e70_xult/tasks.c ../src/main.c ../src/app.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/917764137/bsp.o ${OBJECTDIR}/_ext/1639147296/plib_afec0.o ${OBJECTDIR}/_ext/1639147296/plib_afec1.o ${OBJECTDIR}/_ext/1055500827/plib_clk.o ${OBJECTDIR}/_ext/1055499099/plib_efc.o ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o ${OBJECTDIR}/_ext/1639550079/plib_nvic.o ${OBJECTDIR}/_ext/1055488423/plib_pio.o ${OBJECTDIR}/_ext/865331892/plib_tc0.o ${OBJECTDIR}/_ext/1639738731/plib_uart2.o ${OBJECTDIR}/_ext/1639738731/plib_uart1.o ${OBJECTDIR}/_ext/707186936/plib_usart1.o ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o ${OBJECTDIR}/_ext/876653320/sys_cache.o ${OBJECTDIR}/_ext/1953779166/sys_console.o ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o ${OBJECTDIR}/_ext/1763620194/sys_debug.o ${OBJECTDIR}/_ext/766002106/sys_int.o ${OBJECTDIR}/_ext/1728594169/initialization.o ${OBJECTDIR}/_ext/1728594169/interrupts.o ${OBJECTDIR}/_ext/1728594169/exceptions.o ${OBJECTDIR}/_ext/1728594169/startup_xc32.o ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o ${OBJECTDIR}/_ext/1728594169/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/917764137/bsp.o.d ${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d ${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d ${OBJECTDIR}/_ext/1055500827/plib_clk.o.d ${OBJECTDIR}/_ext/1055499099/plib_efc.o.d ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d ${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d ${OBJECTDIR}/_ext/1055488423/plib_pio.o.d ${OBJECTDIR}/_ext/865331892/plib_tc0.o.d ${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d ${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d ${OBJECTDIR}/_ext/707186936/plib_usart1.o.d ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d ${OBJECTDIR}/_ext/876653320/sys_cache.o.d ${OBJECTDIR}/_ext/1953779166/sys_console.o.d ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d ${OBJECTDIR}/_ext/1763620194/sys_debug.o.d ${OBJECTDIR}/_ext/766002106/sys_int.o.d ${OBJECTDIR}/_ext/1728594169/initialization.o.d ${OBJECTDIR}/_ext/1728594169/interrupts.o.d ${OBJECTDIR}/_ext/1728594169/exceptions.o.d ${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d ${OBJECTDIR}/_ext/1728594169/tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/917764137/bsp.o ${OBJECTDIR}/_ext/1639147296/plib_afec0.o ${OBJECTDIR}/_ext/1639147296/plib_afec1.o ${OBJECTDIR}/_ext/1055500827/plib_clk.o ${OBJECTDIR}/_ext/1055499099/plib_efc.o ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o ${OBJECTDIR}/_ext/1639550079/plib_nvic.o ${OBJECTDIR}/_ext/1055488423/plib_pio.o ${OBJECTDIR}/_ext/865331892/plib_tc0.o ${OBJECTDIR}/_ext/1639738731/plib_uart2.o ${OBJECTDIR}/_ext/1639738731/plib_uart1.o ${OBJECTDIR}/_ext/707186936/plib_usart1.o ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o ${OBJECTDIR}/_ext/876653320/sys_cache.o ${OBJECTDIR}/_ext/1953779166/sys_console.o ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o ${OBJECTDIR}/_ext/1763620194/sys_debug.o ${OBJECTDIR}/_ext/766002106/sys_int.o ${OBJECTDIR}/_ext/1728594169/initialization.o ${OBJECTDIR}/_ext/1728594169/interrupts.o ${OBJECTDIR}/_ext/1728594169/exceptions.o ${OBJECTDIR}/_ext/1728594169/startup_xc32.o ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o ${OBJECTDIR}/_ext/1728594169/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o

# Source Files
SOURCEFILES=../src/config/sam_e70_xult/bsp/bsp.c ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c ../src/config/sam_e70_xult/stdio/xc32_monitor.c ../src/config/sam_e70_xult/system/cache/sys_cache.c ../src/config/sam_e70_xult/system/console/src/sys_console.c ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c ../src/config/sam_e70_xult/system/debug/src/sys_debug.c ../src/config/sam_e70_xult/system/int/src/sys_int.c ../src/config/sam_e70_xult/initialization.c ../src/config/sam_e70_xult/interrupts.c ../src/config/sam_e70_xult/exceptions.c ../src/config/sam_e70_xult/startup_xc32.c ../src/config/sam_e70_xult/libc_syscalls.c ../src/config/sam_e70_xult/tasks.c ../src/main.c ../src/app.c

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
${OBJECTDIR}/_ext/917764137/bsp.o: ../src/config/sam_e70_xult/bsp/bsp.c  .generated_files/flags/sam_e70_xult/954a750d3db25a8d7127528de912df036b686281 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/917764137" 
	@${RM} ${OBJECTDIR}/_ext/917764137/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/917764137/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/917764137/bsp.o.d" -o ${OBJECTDIR}/_ext/917764137/bsp.o ../src/config/sam_e70_xult/bsp/bsp.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639147296/plib_afec0.o: ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c  .generated_files/flags/sam_e70_xult/2bedf258eab48d107de1cd1810a320c926a0fa70 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639147296" 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d" -o ${OBJECTDIR}/_ext/1639147296/plib_afec0.o ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639147296/plib_afec1.o: ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c  .generated_files/flags/sam_e70_xult/14168c3a75dbcd44c3272ab19b76d828e310c07c .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639147296" 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d" -o ${OBJECTDIR}/_ext/1639147296/plib_afec1.o ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055500827/plib_clk.o: ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c  .generated_files/flags/sam_e70_xult/1ba3bad16bfb1a122450f354ab16e8c0aedba13e .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055500827" 
	@${RM} ${OBJECTDIR}/_ext/1055500827/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055500827/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055500827/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1055500827/plib_clk.o ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055499099/plib_efc.o: ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c  .generated_files/flags/sam_e70_xult/41b5005f38602297e902b63b28231d091016a562 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055499099" 
	@${RM} ${OBJECTDIR}/_ext/1055499099/plib_efc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055499099/plib_efc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055499099/plib_efc.o.d" -o ${OBJECTDIR}/_ext/1055499099/plib_efc.o ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639501792/plib_mcan0.o: ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c  .generated_files/flags/sam_e70_xult/c25a0bcce2cbcaa21ac114c52dce0d06e9401211 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639501792" 
	@${RM} ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d" -o ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639550079/plib_nvic.o: ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e70_xult/36dc4d23f46dd6625dbf9f88dba0b00c19c54700 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639550079" 
	@${RM} ${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639550079/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1639550079/plib_nvic.o ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055488423/plib_pio.o: ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c  .generated_files/flags/sam_e70_xult/e8a408d3e70cb85ace0bfc91c6dd817910d6ba8b .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055488423" 
	@${RM} ${OBJECTDIR}/_ext/1055488423/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055488423/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055488423/plib_pio.o.d" -o ${OBJECTDIR}/_ext/1055488423/plib_pio.o ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/865331892/plib_tc0.o: ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c  .generated_files/flags/sam_e70_xult/486080da4e8b3e7e4eeaf3b629799437b0cef4f7 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/865331892" 
	@${RM} ${OBJECTDIR}/_ext/865331892/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/865331892/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/865331892/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/865331892/plib_tc0.o ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639738731/plib_uart2.o: ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c  .generated_files/flags/sam_e70_xult/3c0924c0d531da912a6d44f9f0836370fd82ab0b .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639738731" 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/1639738731/plib_uart2.o ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639738731/plib_uart1.o: ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c  .generated_files/flags/sam_e70_xult/331b09443a1d2dc28414768a2ea13f71bf9ffecb .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639738731" 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1639738731/plib_uart1.o ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/707186936/plib_usart1.o: ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c  .generated_files/flags/sam_e70_xult/8c97af61568ed7519c19aae160c9acfac477080b .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/707186936" 
	@${RM} ${OBJECTDIR}/_ext/707186936/plib_usart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/707186936/plib_usart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/707186936/plib_usart1.o.d" -o ${OBJECTDIR}/_ext/707186936/plib_usart1.o ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1518761459/xc32_monitor.o: ../src/config/sam_e70_xult/stdio/xc32_monitor.c  .generated_files/flags/sam_e70_xult/9f46c201b5a917fc145c386f36b20dcdfe41ca31 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1518761459" 
	@${RM} ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o ../src/config/sam_e70_xult/stdio/xc32_monitor.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/876653320/sys_cache.o: ../src/config/sam_e70_xult/system/cache/sys_cache.c  .generated_files/flags/sam_e70_xult/ad195493e780c8667268a365c3161fc13e315983 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/876653320" 
	@${RM} ${OBJECTDIR}/_ext/876653320/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/876653320/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/876653320/sys_cache.o.d" -o ${OBJECTDIR}/_ext/876653320/sys_cache.o ../src/config/sam_e70_xult/system/cache/sys_cache.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1953779166/sys_console.o: ../src/config/sam_e70_xult/system/console/src/sys_console.c  .generated_files/flags/sam_e70_xult/adf3ee9f193688b58161f6c85250e672cff9aecc .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1953779166" 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1953779166/sys_console.o.d" -o ${OBJECTDIR}/_ext/1953779166/sys_console.o ../src/config/sam_e70_xult/system/console/src/sys_console.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1953779166/sys_console_uart.o: ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c  .generated_files/flags/sam_e70_xult/5196ffe323295450254f235f5b9c3219e74274de .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1953779166" 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1763620194/sys_debug.o: ../src/config/sam_e70_xult/system/debug/src/sys_debug.c  .generated_files/flags/sam_e70_xult/ef25a664f970dfa79bb3216bba9172c5d7ef3cff .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1763620194" 
	@${RM} ${OBJECTDIR}/_ext/1763620194/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1763620194/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1763620194/sys_debug.o.d" -o ${OBJECTDIR}/_ext/1763620194/sys_debug.o ../src/config/sam_e70_xult/system/debug/src/sys_debug.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/766002106/sys_int.o: ../src/config/sam_e70_xult/system/int/src/sys_int.c  .generated_files/flags/sam_e70_xult/d577dd3d0a256b6b0fe7853c7582b4f304e95ab7 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/766002106" 
	@${RM} ${OBJECTDIR}/_ext/766002106/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/766002106/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/766002106/sys_int.o.d" -o ${OBJECTDIR}/_ext/766002106/sys_int.o ../src/config/sam_e70_xult/system/int/src/sys_int.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/initialization.o: ../src/config/sam_e70_xult/initialization.c  .generated_files/flags/sam_e70_xult/afe7a48df7a05c6a661bce3de2ad761ad0d23ca3 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/initialization.o.d" -o ${OBJECTDIR}/_ext/1728594169/initialization.o ../src/config/sam_e70_xult/initialization.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/interrupts.o: ../src/config/sam_e70_xult/interrupts.c  .generated_files/flags/sam_e70_xult/99817205b112d9191fb0cb73586d4df26ccab98f .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/interrupts.o.d" -o ${OBJECTDIR}/_ext/1728594169/interrupts.o ../src/config/sam_e70_xult/interrupts.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/exceptions.o: ../src/config/sam_e70_xult/exceptions.c  .generated_files/flags/sam_e70_xult/efab57224fbfeb779e626e2f928fe219f72c48d0 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/exceptions.o.d" -o ${OBJECTDIR}/_ext/1728594169/exceptions.o ../src/config/sam_e70_xult/exceptions.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/startup_xc32.o: ../src/config/sam_e70_xult/startup_xc32.c  .generated_files/flags/sam_e70_xult/3b8c80c38874e3dd80d29fe7da7a20e8683c755a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1728594169/startup_xc32.o ../src/config/sam_e70_xult/startup_xc32.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/libc_syscalls.o: ../src/config/sam_e70_xult/libc_syscalls.c  .generated_files/flags/sam_e70_xult/93e41fde611115aac6f68d2cdb0664d679db3884 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o ../src/config/sam_e70_xult/libc_syscalls.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/tasks.o: ../src/config/sam_e70_xult/tasks.c  .generated_files/flags/sam_e70_xult/a919bb93c872242c74f5529df68fba024f6053ee .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/tasks.o.d" -o ${OBJECTDIR}/_ext/1728594169/tasks.o ../src/config/sam_e70_xult/tasks.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/sam_e70_xult/40b4afff4af283c4b60506482d9e03c9e1f2f34d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/sam_e70_xult/13b1acb4f9d82a10634686d2f01fdd73aa386081 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/917764137/bsp.o: ../src/config/sam_e70_xult/bsp/bsp.c  .generated_files/flags/sam_e70_xult/d0ad231e0692dd77770d91a759859475047ed197 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/917764137" 
	@${RM} ${OBJECTDIR}/_ext/917764137/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/917764137/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/917764137/bsp.o.d" -o ${OBJECTDIR}/_ext/917764137/bsp.o ../src/config/sam_e70_xult/bsp/bsp.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639147296/plib_afec0.o: ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c  .generated_files/flags/sam_e70_xult/4cf2dd6029b4310a64054b986f19111e355e1782 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639147296" 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639147296/plib_afec0.o.d" -o ${OBJECTDIR}/_ext/1639147296/plib_afec0.o ../src/config/sam_e70_xult/peripheral/afec/plib_afec0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639147296/plib_afec1.o: ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c  .generated_files/flags/sam_e70_xult/e8d341bca3de0be9f0661c5e4b9c359a4a621a0c .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639147296" 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639147296/plib_afec1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639147296/plib_afec1.o.d" -o ${OBJECTDIR}/_ext/1639147296/plib_afec1.o ../src/config/sam_e70_xult/peripheral/afec/plib_afec1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055500827/plib_clk.o: ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c  .generated_files/flags/sam_e70_xult/d6b8de722e980f2e3fa2aa577dd154b2ee171ccb .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055500827" 
	@${RM} ${OBJECTDIR}/_ext/1055500827/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055500827/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055500827/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1055500827/plib_clk.o ../src/config/sam_e70_xult/peripheral/clk/plib_clk.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055499099/plib_efc.o: ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c  .generated_files/flags/sam_e70_xult/4f0e077ad7b098617bafd11bb66c4c1cddc022cb .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055499099" 
	@${RM} ${OBJECTDIR}/_ext/1055499099/plib_efc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055499099/plib_efc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055499099/plib_efc.o.d" -o ${OBJECTDIR}/_ext/1055499099/plib_efc.o ../src/config/sam_e70_xult/peripheral/efc/plib_efc.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639501792/plib_mcan0.o: ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c  .generated_files/flags/sam_e70_xult/3b497f02aef70ab5be89fc30c41dc6be5c592ada .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639501792" 
	@${RM} ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639501792/plib_mcan0.o.d" -o ${OBJECTDIR}/_ext/1639501792/plib_mcan0.o ../src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639550079/plib_nvic.o: ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e70_xult/ec645a42a2655031321691496b9476fc6cdfb770 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639550079" 
	@${RM} ${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639550079/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639550079/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1639550079/plib_nvic.o ../src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1055488423/plib_pio.o: ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c  .generated_files/flags/sam_e70_xult/95e2a2c7e5ff1c22f90e09fb6903fbf7207ff021 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1055488423" 
	@${RM} ${OBJECTDIR}/_ext/1055488423/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1055488423/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1055488423/plib_pio.o.d" -o ${OBJECTDIR}/_ext/1055488423/plib_pio.o ../src/config/sam_e70_xult/peripheral/pio/plib_pio.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/865331892/plib_tc0.o: ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c  .generated_files/flags/sam_e70_xult/ae45550de0df7f82fc4ddb95d571c02b94210325 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/865331892" 
	@${RM} ${OBJECTDIR}/_ext/865331892/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/865331892/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/865331892/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/865331892/plib_tc0.o ../src/config/sam_e70_xult/peripheral/tc/plib_tc0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639738731/plib_uart2.o: ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c  .generated_files/flags/sam_e70_xult/23c01ea5a56e0dffab4c021ec64de71795668a90 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639738731" 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639738731/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/1639738731/plib_uart2.o ../src/config/sam_e70_xult/peripheral/uart/plib_uart2.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1639738731/plib_uart1.o: ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c  .generated_files/flags/sam_e70_xult/291cecdec47c080d73dfef41736bf02b5e53d084 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1639738731" 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639738731/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639738731/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1639738731/plib_uart1.o ../src/config/sam_e70_xult/peripheral/uart/plib_uart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/707186936/plib_usart1.o: ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c  .generated_files/flags/sam_e70_xult/42cf70ca7cc9794a0b5c7ee136daa66b056842dc .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/707186936" 
	@${RM} ${OBJECTDIR}/_ext/707186936/plib_usart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/707186936/plib_usart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/707186936/plib_usart1.o.d" -o ${OBJECTDIR}/_ext/707186936/plib_usart1.o ../src/config/sam_e70_xult/peripheral/usart/plib_usart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1518761459/xc32_monitor.o: ../src/config/sam_e70_xult/stdio/xc32_monitor.c  .generated_files/flags/sam_e70_xult/380ae6d476b5930a8e6efd9facd1016630f76fb9 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1518761459" 
	@${RM} ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1518761459/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1518761459/xc32_monitor.o ../src/config/sam_e70_xult/stdio/xc32_monitor.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/876653320/sys_cache.o: ../src/config/sam_e70_xult/system/cache/sys_cache.c  .generated_files/flags/sam_e70_xult/354a5dcdf6689c805f492b7dc63ff6186a6c876c .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/876653320" 
	@${RM} ${OBJECTDIR}/_ext/876653320/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/876653320/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/876653320/sys_cache.o.d" -o ${OBJECTDIR}/_ext/876653320/sys_cache.o ../src/config/sam_e70_xult/system/cache/sys_cache.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1953779166/sys_console.o: ../src/config/sam_e70_xult/system/console/src/sys_console.c  .generated_files/flags/sam_e70_xult/66f883db4793dc8f16cf7022d8b1e820071193f5 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1953779166" 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1953779166/sys_console.o.d" -o ${OBJECTDIR}/_ext/1953779166/sys_console.o ../src/config/sam_e70_xult/system/console/src/sys_console.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1953779166/sys_console_uart.o: ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c  .generated_files/flags/sam_e70_xult/4818f9a7cdde908d7e45dc5421555e80fff2b232 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1953779166" 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1953779166/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1953779166/sys_console_uart.o ../src/config/sam_e70_xult/system/console/src/sys_console_uart.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1763620194/sys_debug.o: ../src/config/sam_e70_xult/system/debug/src/sys_debug.c  .generated_files/flags/sam_e70_xult/4341ecfef3dc80d066d0727345b5cce4d37763b1 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1763620194" 
	@${RM} ${OBJECTDIR}/_ext/1763620194/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1763620194/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1763620194/sys_debug.o.d" -o ${OBJECTDIR}/_ext/1763620194/sys_debug.o ../src/config/sam_e70_xult/system/debug/src/sys_debug.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/766002106/sys_int.o: ../src/config/sam_e70_xult/system/int/src/sys_int.c  .generated_files/flags/sam_e70_xult/a7f08dcef53c9917f88e24a9e1d0f66801fc2ea .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/766002106" 
	@${RM} ${OBJECTDIR}/_ext/766002106/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/766002106/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/766002106/sys_int.o.d" -o ${OBJECTDIR}/_ext/766002106/sys_int.o ../src/config/sam_e70_xult/system/int/src/sys_int.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/initialization.o: ../src/config/sam_e70_xult/initialization.c  .generated_files/flags/sam_e70_xult/251448b83b55ada5629dac9cfa0b8b8253e4be0f .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/initialization.o.d" -o ${OBJECTDIR}/_ext/1728594169/initialization.o ../src/config/sam_e70_xult/initialization.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/interrupts.o: ../src/config/sam_e70_xult/interrupts.c  .generated_files/flags/sam_e70_xult/5b1491b24e159142c409591c529e78f6db739778 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/interrupts.o.d" -o ${OBJECTDIR}/_ext/1728594169/interrupts.o ../src/config/sam_e70_xult/interrupts.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/exceptions.o: ../src/config/sam_e70_xult/exceptions.c  .generated_files/flags/sam_e70_xult/4870b4e7ddaf91996a116842a082c1ec845e23e4 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/exceptions.o.d" -o ${OBJECTDIR}/_ext/1728594169/exceptions.o ../src/config/sam_e70_xult/exceptions.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/startup_xc32.o: ../src/config/sam_e70_xult/startup_xc32.c  .generated_files/flags/sam_e70_xult/4361b24945a028652fd8d40858d9ae470c1d2ef8 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1728594169/startup_xc32.o ../src/config/sam_e70_xult/startup_xc32.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/libc_syscalls.o: ../src/config/sam_e70_xult/libc_syscalls.c  .generated_files/flags/sam_e70_xult/d201bacb596e7bf62930dfbc67e66191fe750783 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1728594169/libc_syscalls.o ../src/config/sam_e70_xult/libc_syscalls.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1728594169/tasks.o: ../src/config/sam_e70_xult/tasks.c  .generated_files/flags/sam_e70_xult/22d871169cd34bea10fc4719e9cfc10dfe48f6b5 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1728594169" 
	@${RM} ${OBJECTDIR}/_ext/1728594169/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728594169/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728594169/tasks.o.d" -o ${OBJECTDIR}/_ext/1728594169/tasks.o ../src/config/sam_e70_xult/tasks.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/sam_e70_xult/8dd0bc473fd6a545e8016144f09f6afc71d57959 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/sam_e70_xult/9ceb02ff157d16b81da8bd04915ab7b055ed372d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/same70b"
	
else
${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/sam_e70_xult/ATSAME70Q21B.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/sam_e70_xult.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/same70b"
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

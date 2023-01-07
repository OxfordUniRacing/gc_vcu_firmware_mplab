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
FINAL_IMAGE=${DISTDIR}/VCU.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/VCU.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/bsp/bsp.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec0.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec1.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/clk/plib_clk.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/efc/plib_efc.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/pio/plib_pio.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/tc/plib_tc0.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart2.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart1.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/usart/plib_usart1.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/stdio/xc32_monitor.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/cache/sys_cache.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console_uart.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/debug/src/sys_debug.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/int/src/sys_int.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/initialization.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/interrupts.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/exceptions.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/startup_xc32.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/libc_syscalls.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/tasks.c ../../../../Downloads/firmware/firmware/src/main.c ../../../../Downloads/firmware/firmware/src/app.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/518241268/bsp.o ${OBJECTDIR}/_ext/1799148139/plib_afec0.o ${OBJECTDIR}/_ext/1799148139/plib_afec1.o ${OBJECTDIR}/_ext/1604528838/plib_clk.o ${OBJECTDIR}/_ext/1604527110/plib_efc.o ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o ${OBJECTDIR}/_ext/1799550922/plib_nvic.o ${OBJECTDIR}/_ext/1604516434/plib_pio.o ${OBJECTDIR}/_ext/883042473/plib_tc0.o ${OBJECTDIR}/_ext/1799739574/plib_uart2.o ${OBJECTDIR}/_ext/1799739574/plib_uart1.o ${OBJECTDIR}/_ext/42128099/plib_usart1.o ${OBJECTDIR}/_ext/170626306/xc32_monitor.o ${OBJECTDIR}/_ext/1339532685/sys_cache.o ${OBJECTDIR}/_ext/1512603383/sys_console.o ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o ${OBJECTDIR}/_ext/1098561357/sys_debug.o ${OBJECTDIR}/_ext/216974095/sys_int.o ${OBJECTDIR}/_ext/1615879612/initialization.o ${OBJECTDIR}/_ext/1615879612/interrupts.o ${OBJECTDIR}/_ext/1615879612/exceptions.o ${OBJECTDIR}/_ext/1615879612/startup_xc32.o ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o ${OBJECTDIR}/_ext/1615879612/tasks.o ${OBJECTDIR}/_ext/1255994848/main.o ${OBJECTDIR}/_ext/1255994848/app.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/518241268/bsp.o.d ${OBJECTDIR}/_ext/1799148139/plib_afec0.o.d ${OBJECTDIR}/_ext/1799148139/plib_afec1.o.d ${OBJECTDIR}/_ext/1604528838/plib_clk.o.d ${OBJECTDIR}/_ext/1604527110/plib_efc.o.d ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o.d ${OBJECTDIR}/_ext/1799550922/plib_nvic.o.d ${OBJECTDIR}/_ext/1604516434/plib_pio.o.d ${OBJECTDIR}/_ext/883042473/plib_tc0.o.d ${OBJECTDIR}/_ext/1799739574/plib_uart2.o.d ${OBJECTDIR}/_ext/1799739574/plib_uart1.o.d ${OBJECTDIR}/_ext/42128099/plib_usart1.o.d ${OBJECTDIR}/_ext/170626306/xc32_monitor.o.d ${OBJECTDIR}/_ext/1339532685/sys_cache.o.d ${OBJECTDIR}/_ext/1512603383/sys_console.o.d ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o.d ${OBJECTDIR}/_ext/1098561357/sys_debug.o.d ${OBJECTDIR}/_ext/216974095/sys_int.o.d ${OBJECTDIR}/_ext/1615879612/initialization.o.d ${OBJECTDIR}/_ext/1615879612/interrupts.o.d ${OBJECTDIR}/_ext/1615879612/exceptions.o.d ${OBJECTDIR}/_ext/1615879612/startup_xc32.o.d ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o.d ${OBJECTDIR}/_ext/1615879612/tasks.o.d ${OBJECTDIR}/_ext/1255994848/main.o.d ${OBJECTDIR}/_ext/1255994848/app.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/518241268/bsp.o ${OBJECTDIR}/_ext/1799148139/plib_afec0.o ${OBJECTDIR}/_ext/1799148139/plib_afec1.o ${OBJECTDIR}/_ext/1604528838/plib_clk.o ${OBJECTDIR}/_ext/1604527110/plib_efc.o ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o ${OBJECTDIR}/_ext/1799550922/plib_nvic.o ${OBJECTDIR}/_ext/1604516434/plib_pio.o ${OBJECTDIR}/_ext/883042473/plib_tc0.o ${OBJECTDIR}/_ext/1799739574/plib_uart2.o ${OBJECTDIR}/_ext/1799739574/plib_uart1.o ${OBJECTDIR}/_ext/42128099/plib_usart1.o ${OBJECTDIR}/_ext/170626306/xc32_monitor.o ${OBJECTDIR}/_ext/1339532685/sys_cache.o ${OBJECTDIR}/_ext/1512603383/sys_console.o ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o ${OBJECTDIR}/_ext/1098561357/sys_debug.o ${OBJECTDIR}/_ext/216974095/sys_int.o ${OBJECTDIR}/_ext/1615879612/initialization.o ${OBJECTDIR}/_ext/1615879612/interrupts.o ${OBJECTDIR}/_ext/1615879612/exceptions.o ${OBJECTDIR}/_ext/1615879612/startup_xc32.o ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o ${OBJECTDIR}/_ext/1615879612/tasks.o ${OBJECTDIR}/_ext/1255994848/main.o ${OBJECTDIR}/_ext/1255994848/app.o

# Source Files
SOURCEFILES=../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/bsp/bsp.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec0.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec1.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/clk/plib_clk.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/efc/plib_efc.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/pio/plib_pio.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/tc/plib_tc0.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart2.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart1.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/usart/plib_usart1.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/stdio/xc32_monitor.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/cache/sys_cache.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console_uart.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/debug/src/sys_debug.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/int/src/sys_int.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/initialization.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/interrupts.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/exceptions.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/startup_xc32.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/libc_syscalls.c ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/tasks.c ../../../../Downloads/firmware/firmware/src/main.c ../../../../Downloads/firmware/firmware/src/app.c

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
	${MAKE}  -f nbproject/Makefile-sam_e70_xult.mk ${DISTDIR}/VCU.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAME70Q21B
MP_LINKER_FILE_OPTION=,--script="..\..\..\..\Downloads\firmware\firmware\src\config\sam_e70_xult\ATSAME70Q21B.ld"
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
${OBJECTDIR}/_ext/518241268/bsp.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/bsp/bsp.c  .generated_files/flags/sam_e70_xult/a524f48ab6f47f149e1b8a51193a61c332fd5570 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/518241268" 
	@${RM} ${OBJECTDIR}/_ext/518241268/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/518241268/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/518241268/bsp.o.d" -o ${OBJECTDIR}/_ext/518241268/bsp.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/bsp/bsp.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799148139/plib_afec0.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec0.c  .generated_files/flags/sam_e70_xult/79cb5d8fe686bb6f59162ffffe7776eb6c4ee037 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799148139" 
	@${RM} ${OBJECTDIR}/_ext/1799148139/plib_afec0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799148139/plib_afec0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799148139/plib_afec0.o.d" -o ${OBJECTDIR}/_ext/1799148139/plib_afec0.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799148139/plib_afec1.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec1.c  .generated_files/flags/sam_e70_xult/51c5df54670bf53f5b21a273e11711a9f3c18d94 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799148139" 
	@${RM} ${OBJECTDIR}/_ext/1799148139/plib_afec1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799148139/plib_afec1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799148139/plib_afec1.o.d" -o ${OBJECTDIR}/_ext/1799148139/plib_afec1.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1604528838/plib_clk.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/clk/plib_clk.c  .generated_files/flags/sam_e70_xult/76093f4bf7fb20312d8b8806ef51e5e70bc355ae .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1604528838" 
	@${RM} ${OBJECTDIR}/_ext/1604528838/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1604528838/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1604528838/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1604528838/plib_clk.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/clk/plib_clk.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1604527110/plib_efc.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/efc/plib_efc.c  .generated_files/flags/sam_e70_xult/9a05b382c09f259305420219437232bcf57c98e5 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1604527110" 
	@${RM} ${OBJECTDIR}/_ext/1604527110/plib_efc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1604527110/plib_efc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1604527110/plib_efc.o.d" -o ${OBJECTDIR}/_ext/1604527110/plib_efc.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/efc/plib_efc.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799502635/plib_mcan0.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c  .generated_files/flags/sam_e70_xult/e26f25a3687817a77eb5586ed6a41df3b30c9444 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799502635" 
	@${RM} ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799502635/plib_mcan0.o.d" -o ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799550922/plib_nvic.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e70_xult/1a9ccc6e98a493a514664ed9261953dae44f5cbc .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799550922" 
	@${RM} ${OBJECTDIR}/_ext/1799550922/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799550922/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799550922/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1799550922/plib_nvic.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1604516434/plib_pio.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/pio/plib_pio.c  .generated_files/flags/sam_e70_xult/1d189648fc1a3d13faa0bd3e87c0e20600fa9f92 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1604516434" 
	@${RM} ${OBJECTDIR}/_ext/1604516434/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1604516434/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1604516434/plib_pio.o.d" -o ${OBJECTDIR}/_ext/1604516434/plib_pio.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/pio/plib_pio.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/883042473/plib_tc0.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/tc/plib_tc0.c  .generated_files/flags/sam_e70_xult/acf11c2a450cb0eb3fec0a968eef4ac149b02110 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/883042473" 
	@${RM} ${OBJECTDIR}/_ext/883042473/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/883042473/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/883042473/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/883042473/plib_tc0.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/tc/plib_tc0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799739574/plib_uart2.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart2.c  .generated_files/flags/sam_e70_xult/4ae5dfc44712ff633e5bf2d98925ec4c43dfc3d0 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799739574" 
	@${RM} ${OBJECTDIR}/_ext/1799739574/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799739574/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799739574/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/1799739574/plib_uart2.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart2.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799739574/plib_uart1.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart1.c  .generated_files/flags/sam_e70_xult/48c9e05a4fbc407f3cf1f96ceae4cc4e65dc8297 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799739574" 
	@${RM} ${OBJECTDIR}/_ext/1799739574/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799739574/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799739574/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1799739574/plib_uart1.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/42128099/plib_usart1.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/usart/plib_usart1.c  .generated_files/flags/sam_e70_xult/4824ded45ff1568c73def48d79cd2816499304c7 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/42128099" 
	@${RM} ${OBJECTDIR}/_ext/42128099/plib_usart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/42128099/plib_usart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/42128099/plib_usart1.o.d" -o ${OBJECTDIR}/_ext/42128099/plib_usart1.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/usart/plib_usart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/170626306/xc32_monitor.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/stdio/xc32_monitor.c  .generated_files/flags/sam_e70_xult/f5a38b17769623f220aa172719d19c81501e530e .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/170626306" 
	@${RM} ${OBJECTDIR}/_ext/170626306/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/170626306/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/170626306/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/170626306/xc32_monitor.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/stdio/xc32_monitor.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1339532685/sys_cache.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/cache/sys_cache.c  .generated_files/flags/sam_e70_xult/24ec45cf7384a64216ebfba52cb9e253bf8f14cb .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1339532685" 
	@${RM} ${OBJECTDIR}/_ext/1339532685/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1339532685/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1339532685/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1339532685/sys_cache.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/cache/sys_cache.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512603383/sys_console.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console.c  .generated_files/flags/sam_e70_xult/bf1d33cda5799683dabf570f5af77d9439116d2 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512603383" 
	@${RM} ${OBJECTDIR}/_ext/1512603383/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512603383/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1512603383/sys_console.o.d" -o ${OBJECTDIR}/_ext/1512603383/sys_console.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512603383/sys_console_uart.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console_uart.c  .generated_files/flags/sam_e70_xult/4fcc743362e0e85496b02df50a9ac13834c02e33 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512603383" 
	@${RM} ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1512603383/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console_uart.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1098561357/sys_debug.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/debug/src/sys_debug.c  .generated_files/flags/sam_e70_xult/b6c4379e5387caeca0a83741221e017f5ef67bc0 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098561357" 
	@${RM} ${OBJECTDIR}/_ext/1098561357/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098561357/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098561357/sys_debug.o.d" -o ${OBJECTDIR}/_ext/1098561357/sys_debug.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/debug/src/sys_debug.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/216974095/sys_int.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/int/src/sys_int.c  .generated_files/flags/sam_e70_xult/2b3f079259195bc3bc984c3d199ea65d3d6e4a24 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/216974095" 
	@${RM} ${OBJECTDIR}/_ext/216974095/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/216974095/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/216974095/sys_int.o.d" -o ${OBJECTDIR}/_ext/216974095/sys_int.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/int/src/sys_int.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/initialization.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/initialization.c  .generated_files/flags/sam_e70_xult/a3b87a998569a2f1021d07c55cb50277f25ea4d0 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/initialization.o.d" -o ${OBJECTDIR}/_ext/1615879612/initialization.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/initialization.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/interrupts.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/interrupts.c  .generated_files/flags/sam_e70_xult/53a76f5541cb6952f09e49cbd72f3e228c3eec21 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/interrupts.o.d" -o ${OBJECTDIR}/_ext/1615879612/interrupts.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/interrupts.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/exceptions.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/exceptions.c  .generated_files/flags/sam_e70_xult/50186e8f0eb87c335ca20ce84dca2e0915a12d4e .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/exceptions.o.d" -o ${OBJECTDIR}/_ext/1615879612/exceptions.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/exceptions.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/startup_xc32.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/startup_xc32.c  .generated_files/flags/sam_e70_xult/33a2c59ca1db6bda03dafa643377807d60346649 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1615879612/startup_xc32.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/startup_xc32.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/libc_syscalls.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/libc_syscalls.c  .generated_files/flags/sam_e70_xult/847492f32f5b637304177bb2f5e68391b3f1f802 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/libc_syscalls.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/tasks.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/tasks.c  .generated_files/flags/sam_e70_xult/6e07a5bd4b1ab03645836f0a41b0c5fa6348f092 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/tasks.o.d" -o ${OBJECTDIR}/_ext/1615879612/tasks.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/tasks.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1255994848/main.o: ../../../../Downloads/firmware/firmware/src/main.c  .generated_files/flags/sam_e70_xult/ac629159414596ddc49554a5d8f32b798de1930c .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1255994848" 
	@${RM} ${OBJECTDIR}/_ext/1255994848/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1255994848/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1255994848/main.o.d" -o ${OBJECTDIR}/_ext/1255994848/main.o ../../../../Downloads/firmware/firmware/src/main.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1255994848/app.o: ../../../../Downloads/firmware/firmware/src/app.c  .generated_files/flags/sam_e70_xult/db9799b52ad080af0d7905dfefc372732d7c81ce .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1255994848" 
	@${RM} ${OBJECTDIR}/_ext/1255994848/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1255994848/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1255994848/app.o.d" -o ${OBJECTDIR}/_ext/1255994848/app.o ../../../../Downloads/firmware/firmware/src/app.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/518241268/bsp.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/bsp/bsp.c  .generated_files/flags/sam_e70_xult/dc5aac82849c1e49f30b896ff138ab470e6f038d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/518241268" 
	@${RM} ${OBJECTDIR}/_ext/518241268/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/518241268/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/518241268/bsp.o.d" -o ${OBJECTDIR}/_ext/518241268/bsp.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/bsp/bsp.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799148139/plib_afec0.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec0.c  .generated_files/flags/sam_e70_xult/830271a7ec3fc3bb24153a43aadee52445be4247 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799148139" 
	@${RM} ${OBJECTDIR}/_ext/1799148139/plib_afec0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799148139/plib_afec0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799148139/plib_afec0.o.d" -o ${OBJECTDIR}/_ext/1799148139/plib_afec0.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799148139/plib_afec1.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec1.c  .generated_files/flags/sam_e70_xult/695c9b00af60fe790bccd1873c68806bd501cb6a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799148139" 
	@${RM} ${OBJECTDIR}/_ext/1799148139/plib_afec1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799148139/plib_afec1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799148139/plib_afec1.o.d" -o ${OBJECTDIR}/_ext/1799148139/plib_afec1.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/afec/plib_afec1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1604528838/plib_clk.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/clk/plib_clk.c  .generated_files/flags/sam_e70_xult/ffd2ac1ad0c4c204e5397a34f98af9f34a7d30a7 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1604528838" 
	@${RM} ${OBJECTDIR}/_ext/1604528838/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1604528838/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1604528838/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1604528838/plib_clk.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/clk/plib_clk.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1604527110/plib_efc.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/efc/plib_efc.c  .generated_files/flags/sam_e70_xult/d9aaaaefecfbdce45a07ac00df06de4593086a7f .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1604527110" 
	@${RM} ${OBJECTDIR}/_ext/1604527110/plib_efc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1604527110/plib_efc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1604527110/plib_efc.o.d" -o ${OBJECTDIR}/_ext/1604527110/plib_efc.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/efc/plib_efc.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799502635/plib_mcan0.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c  .generated_files/flags/sam_e70_xult/b7fcc35cc1d65b5889f8a2be3fa60bb29b99475 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799502635" 
	@${RM} ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799502635/plib_mcan0.o.d" -o ${OBJECTDIR}/_ext/1799502635/plib_mcan0.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/mcan/plib_mcan0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799550922/plib_nvic.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e70_xult/f37ed75c47f476e616fcecd94af1883f60a14270 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799550922" 
	@${RM} ${OBJECTDIR}/_ext/1799550922/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799550922/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799550922/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1799550922/plib_nvic.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1604516434/plib_pio.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/pio/plib_pio.c  .generated_files/flags/sam_e70_xult/645ae5e2e12555b56cab21456f062189c82ec722 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1604516434" 
	@${RM} ${OBJECTDIR}/_ext/1604516434/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1604516434/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1604516434/plib_pio.o.d" -o ${OBJECTDIR}/_ext/1604516434/plib_pio.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/pio/plib_pio.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/883042473/plib_tc0.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/tc/plib_tc0.c  .generated_files/flags/sam_e70_xult/b23a368ccfbab5f008526ad98635db8c08f7c917 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/883042473" 
	@${RM} ${OBJECTDIR}/_ext/883042473/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/883042473/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/883042473/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/883042473/plib_tc0.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/tc/plib_tc0.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799739574/plib_uart2.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart2.c  .generated_files/flags/sam_e70_xult/40267ae62100fcc8c4c316dcf0094c2f5b59189e .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799739574" 
	@${RM} ${OBJECTDIR}/_ext/1799739574/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799739574/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799739574/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/1799739574/plib_uart2.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart2.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1799739574/plib_uart1.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart1.c  .generated_files/flags/sam_e70_xult/74ea9309104ea62b2a2ecb0c410ddba810e10c5a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1799739574" 
	@${RM} ${OBJECTDIR}/_ext/1799739574/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1799739574/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1799739574/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1799739574/plib_uart1.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/uart/plib_uart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/42128099/plib_usart1.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/usart/plib_usart1.c  .generated_files/flags/sam_e70_xult/42338443af04107da70f053e851a242be42b2e99 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/42128099" 
	@${RM} ${OBJECTDIR}/_ext/42128099/plib_usart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/42128099/plib_usart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/42128099/plib_usart1.o.d" -o ${OBJECTDIR}/_ext/42128099/plib_usart1.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/peripheral/usart/plib_usart1.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/170626306/xc32_monitor.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/stdio/xc32_monitor.c  .generated_files/flags/sam_e70_xult/84a580daa3f07b95c176385c69c1b9203fa0be59 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/170626306" 
	@${RM} ${OBJECTDIR}/_ext/170626306/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/170626306/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/170626306/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/170626306/xc32_monitor.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/stdio/xc32_monitor.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1339532685/sys_cache.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/cache/sys_cache.c  .generated_files/flags/sam_e70_xult/61cfc4da44dd4554aa9ef7f620347a06a579bc09 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1339532685" 
	@${RM} ${OBJECTDIR}/_ext/1339532685/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1339532685/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1339532685/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1339532685/sys_cache.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/cache/sys_cache.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512603383/sys_console.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console.c  .generated_files/flags/sam_e70_xult/e311dd0069d6b4af6ead832782c7b6ca61b3d36d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512603383" 
	@${RM} ${OBJECTDIR}/_ext/1512603383/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512603383/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1512603383/sys_console.o.d" -o ${OBJECTDIR}/_ext/1512603383/sys_console.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512603383/sys_console_uart.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console_uart.c  .generated_files/flags/sam_e70_xult/8005fcfb4eaed4eeed4feb5054ffa5b8ccd43938 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512603383" 
	@${RM} ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1512603383/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1512603383/sys_console_uart.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/console/src/sys_console_uart.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1098561357/sys_debug.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/debug/src/sys_debug.c  .generated_files/flags/sam_e70_xult/cb3567f924b9920a305050e5e88b9a1f8d8bb4e4 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098561357" 
	@${RM} ${OBJECTDIR}/_ext/1098561357/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098561357/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098561357/sys_debug.o.d" -o ${OBJECTDIR}/_ext/1098561357/sys_debug.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/debug/src/sys_debug.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/216974095/sys_int.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/int/src/sys_int.c  .generated_files/flags/sam_e70_xult/7cec6bd93b4ad943a4d5e041b52144871e33156a .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/216974095" 
	@${RM} ${OBJECTDIR}/_ext/216974095/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/216974095/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/216974095/sys_int.o.d" -o ${OBJECTDIR}/_ext/216974095/sys_int.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/system/int/src/sys_int.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/initialization.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/initialization.c  .generated_files/flags/sam_e70_xult/3a40d3f24bf3e16315dcbb2922a656c910ceaabc .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/initialization.o.d" -o ${OBJECTDIR}/_ext/1615879612/initialization.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/initialization.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/interrupts.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/interrupts.c  .generated_files/flags/sam_e70_xult/3394da774c5645f8071e553084560e4990bee610 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/interrupts.o.d" -o ${OBJECTDIR}/_ext/1615879612/interrupts.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/interrupts.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/exceptions.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/exceptions.c  .generated_files/flags/sam_e70_xult/6fe2bce992ffc1fa4446e9a481b27620501baa21 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/exceptions.o.d" -o ${OBJECTDIR}/_ext/1615879612/exceptions.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/exceptions.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/startup_xc32.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/startup_xc32.c  .generated_files/flags/sam_e70_xult/79ead9443d1cc33ad1a9ee19b1a21173b7e0776d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1615879612/startup_xc32.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/startup_xc32.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/libc_syscalls.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/libc_syscalls.c  .generated_files/flags/sam_e70_xult/3c14184529ff93ea83a437de7672c199abc160ca .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1615879612/libc_syscalls.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/libc_syscalls.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1615879612/tasks.o: ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/tasks.c  .generated_files/flags/sam_e70_xult/d0aefea7a602792fb71a8787acf9dbfd95c764a0 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1615879612" 
	@${RM} ${OBJECTDIR}/_ext/1615879612/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1615879612/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1615879612/tasks.o.d" -o ${OBJECTDIR}/_ext/1615879612/tasks.o ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/tasks.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1255994848/main.o: ../../../../Downloads/firmware/firmware/src/main.c  .generated_files/flags/sam_e70_xult/c56123c28a50586c21d990ac018dd2399fc83a2d .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1255994848" 
	@${RM} ${OBJECTDIR}/_ext/1255994848/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1255994848/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1255994848/main.o.d" -o ${OBJECTDIR}/_ext/1255994848/main.o ../../../../Downloads/firmware/firmware/src/main.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1255994848/app.o: ../../../../Downloads/firmware/firmware/src/app.c  .generated_files/flags/sam_e70_xult/7c6fedc23c326ed8157c13f14276d1f2a7dedb07 .generated_files/flags/sam_e70_xult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1255994848" 
	@${RM} ${OBJECTDIR}/_ext/1255994848/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1255994848/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e70_xult" -I"../src/packs/ATSAME70Q21B_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1255994848/app.o.d" -o ${OBJECTDIR}/_ext/1255994848/app.o ../../../../Downloads/firmware/firmware/src/app.c    -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wformat=2 -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wno-deprecated-declarations -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -Werror-implicit-function-declaration -Wfloat-equal -Wpacked -mdfp="${DFP_DIR}/same70b" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/VCU.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/ATSAME70Q21B.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/VCU.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/same70b"
	
else
${DISTDIR}/VCU.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../../../../Downloads/firmware/firmware/src/config/sam_e70_xult/ATSAME70Q21B.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/VCU.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_e70_xult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/same70b"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/VCU.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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

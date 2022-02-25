
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

set(LOCAL_SRCS)

file(GLOB_RECURSE STM32F769IDISCOVERY_HAL_SRC 
    LIST_DIRECTORIES false 
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${HAL_DRIVER_SRC}/Src/*.c")

# LOSCFG_PLATFORM_STM32F769IDISCOVERY
if(LOSCFG_PLATFORM_STM32F769IDISCOVERY)
    list(REMOVE_ITEM STM32F769IDISCOVERY_HAL_SRC 
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_crc.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_usb.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_utils.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_mmc.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_smbus.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_timebase_rtc_alarm_template.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_timebase_rtc_wakeup_template.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_timebase_tim_template.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_dac.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_dma.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_dma2d.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_exti.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_gpio.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_i2c.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_lptim.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_pwr.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_rcc.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_rng.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_rtc.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_spi.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_tim.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_usart.c
        drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_utils.c)
    set(LOCAL_SRCS ${STM32F769IDISCOVERY_HAL_SRC})

# LOSCFG_PLATFORM_STM32F429IGTX
elseif(LOSCFG_PLATFORM_STM32F429IGTX)
    list(APPEND LOCAL_SRCS
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_iwdg.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_eth.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rng.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sd.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_sdmmc.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sdram.c)

# LOSCFG_PLATFORM_STM32F407_ATK_EXPLORER
elseif(LOSCFG_PLATFORM_STM32F407_ATK_EXPLORER)
    list(APPEND LOCAL_SRCS
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_iwdg.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_eth.c
        drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rng.c)

# LOSCFG_PLATFORM_STM32L431_BearPi
elseif(LOSCFG_PLATFORM_STM32L431_BearPi)
    list(APPEND LOCAL_SRCS 
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_flash.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_tim_ex.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr_ex.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_gpio.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc_ex.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_flash_ex.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_flash_ramfunc.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_cortex.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_uart.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_uart_ex.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_tim.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_spi.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_i2c.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_i2c_ex.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_iwdg.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_adc.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_dma.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_dma_ex.c
        drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rng.c)

# LOSCFG_PLATFORM_STM32F072_Nucleo
elseif(LOSCFG_PLATFORM_STM32F072_Nucleo)
    list(APPEND LOCAL_SRCS 
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_i2c.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash_ex.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc_ex.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_gpio.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim_ex.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_cortex.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_uart.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_spi.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_iwdg.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal.c
        drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_dma.c)
endif()

foreach(src_dir ${HWI_SRC} ${TIMER_SRC} ${HRTIMER_SRC} ${UART_SRC})
    file(GLOB_RECURSE _SRCS_LIST LIST_DIRECTORIES false 
        RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${src_dir}/*.c")
    list(APPEND LOCAL_SRCS ${_SRCS_LIST})
endforeach()

set(LOCAL_INCLUDE 
    "${CMAKE_SOURCE_DIR}/lib/libc/stdio"
    "${CMAKE_SOURCE_DIR}/compat/posix/src"
    "${CMAKE_SOURCE_DIR}/drivers/random/dev/random"
    "${CMAKE_SOURCE_DIR}/targets/bsp/common"
    "${CMAKE_SOURCE_DIR}/targets/bsp/include"
    "${CMAKE_SOURCE_DIR}/targets/bsp/hw/include"
    "${CMAKE_SOURCE_DIR}/targets/bsp/drivers/st_timer"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/Inc"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/include"
    "${CMAKE_SOURCE_DIR}/targets/bsp/${LITEOS_PLATFORM}/include"
    "${CMAKE_SOURCE_DIR}/targets/bsp/${HAL_DRIVER_SRC}/Inc"
    "${CMAKE_SOURCE_DIR}/targets/bsp/${HAL_DRIVER_SRC}/Inc/Legacy"
    "${CMAKE_SOURCE_DIR}/compat/cmsis")   

if(LOSCFG_SHELL AND LOSCFG_SHELL_LK AND LOSCFG_SHELL_DMESG)
    list(APPEND LOCAL_INCLUDE "${CMAKE_SOURCE_DIR}/shell/full/include")
endif()

if(LOSCFG_ARCH_ARM_CORTEX_M)
    file(GLOB_RECURSE _SRCS_LIST 
        LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" 
        "hw/arm/interrupt/nvic/*.c"
        "common/dwt.c"
        "hw/arm/timer/arm_cortex_m/*.c")
    list(APPEND LOCAL_SRCS ${_SRCS_LIST})
    list(APPEND LOCAL_SRCS 
        "drivers/uart/uart_debug.c"
        "drivers/st_timer/timer.c")
endif()

list(APPEND LOCAL_SRCS "common/demo_entry.c")
list(APPEND LOCAL_INCLUDE "${CMAKE_SOURCE_DIR}/include")

if(LOSCFG_COMPONNETS_NET_AT)
    list(APPEND LOCAL_SRCS drivers/uart/at_hal.c)
endif()

if(LOSCFG_DRIVERS_NETDEV)
    file(GLOB_RECURSE _SRCS_LIST 
        LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
        "${NET_SRC}/*.c")
    list(APPEND LOCAL_SRCS ${_SRCS_LIST})
endif()

if(LOSCFG_DRIVERS_RANDOM)
    file(GLOB_RECURSE _SRCS_LIST 
        LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
        "board/${LITEOS_PLATFORM}/random/*.c")
    list(APPEND LOCAL_SRCS ${_SRCS_LIST})
endif()

if(LOSCFG_DRIVERS_USB)
    file(GLOB_RECURSE _SRCS_LIST 
        LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
        "${USB_SRC}/*.c")
    list(APPEND LOCAL_SRCS ${_SRCS_LIST})
endif()

if(LOSCFG_PLATFORM_ADAPT)
    file(GLOB_RECURSE _SRCS_LIST 
        LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
        "board/${LITEOS_PLATFORM}/os_adapt/*.c")
    list(APPEND LOCAL_SRCS ${_SRCS_LIST})
endif()

list(APPEND LOCAL_SRCS "common/demo_entry.c")

if(IS_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/board")
    list(APPEND LOCAL_INCLUDE "board/${LITEOS_PLATFORM}/include/pm")
    file(GLOB_RECURSE _SRCS_LIST 
        LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
        "board/${LITEOS_PLATFORM}/pm/*.c")
    list(APPEND LOCAL_SRCS ${_SRCS_LIST})
endif()

if(LOSCFG_KERNEL_TICKLESS OR LOSCFG_KERNEL_TRACE OR LOSCFG_KERNEL_CPUP OR LOSCFG_KERNEL_RUNSTOP)
    list(APPEND LOCAL_INCLUDE "${CMAKE_SOURCE_DIR}/kernel/extended/include")
endif()

if(LOSCFG_PLATFORM_OSAPPINIT)
    list(APPEND LOCAL_INCLUDE "${CMAKE_SOURCE_DIR}/test/include")
endif()

if(IS_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/board")
    file(GLOB_RECURSE _SRCS_LIST 
        LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
        "board/${LITEOS_PLATFORM}/*.S")
    list(APPEND LOCAL_SRCS ${_SRCS_LIST})
endif()

add_library(${MODULE_NAME} STATIC ${LOCAL_SRCS})

target_include_directories(${MODULE_NAME} BEFORE PRIVATE ${LOCAL_INCLUDE})

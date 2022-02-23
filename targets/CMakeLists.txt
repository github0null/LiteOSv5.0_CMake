
# qemu virt a53 Options
if(LOSCFG_PLATFORM_QEMU_VIRT_A53)
    set(HWI_TYPE arm/interrupt/gic)
    set(TIMER_TYPE arm/timer/arm_generic)
    set(UART_TYPE amba_pl011)
    set(LITEOS_CMACRO_TEST TESTVIRTA53)

# realview pbx a9 Options
elseif(LOSCFG_PLATFORM_PBX_A9)
    set(HWI_TYPE arm/interrupt/gic)
    set(TIMER_TYPE arm/timer/arm_private)
    set(UART_TYPE amba_pl011)
    set(LITEOS_CMACRO_TEST TESTPBXA9)

# STM32F769IDISCOVERY Options
elseif(LOSCFG_PLATFORM_STM32F769IDISCOVERY)
    set(TIMER_TYPE arm/timer/arm_cortex_m)
    set(LITEOS_CMACRO_TEST TESTSTM32F769IDISCOVERY STM32F769xx)
    set(HAL_DRIVER_TYPE STM32F7xx_HAL_Driver)

# STM32F429IGTX Options
elseif(LOSCFG_PLATFORM_STM32F429IGTX)
    set(TIMER_TYPE arm/timer/arm_cortex_m)
    set(LITEOS_CMACRO_TEST TESTSTM32F429IGTX STM32F429xx)
    set(HAL_DRIVER_TYPE STM32F4xx_HAL_Driver)

# STM32F407ZGTX Options
elseif(LOSCFG_PLATFORM_STM32F407_ATK_EXPLORER)
    set(TIMER_TYPE arm/timer/arm_cortex_m)
    set(LITEOS_CMACRO_TEST STM32F407xx)
    set(HAL_DRIVER_TYPE STM32F4xx_HAL_Driver)

# STM32L431_BearPi Options
elseif(LOSCFG_PLATFORM_STM32L431_BearPi)
    set(TIMER_TYPE arm/timer/arm_cortex_m)
    set(LITEOS_CMACRO_TEST TESTSTM32L431_BearPi STM32L431xx)
    set(HAL_DRIVER_TYPE STM32L4xx_HAL_Driver)

# STM32F103VETX Options
elseif(LOSCFG_PLATFORM_STM32F103_FIRE_ARBITRARY)
    set(TIMER_TYPE arm/timer/arm_cortex_m)
    set(LITEOS_CMACRO_TEST __FPU_PRESENT STM32F103xE)
    set(HAL_DRIVER_TYPE STM32F1xx_HAL_Driver)

# realview-pbx-a9 Options
elseif(LOSCFG_PLATFORM_PBX_A9)
    set(HWI_TYPE arm/interrupt/gic)
    set(TIMER_TYPE hw/arm/timer/arm_private)

# STM32F072_Nucleo Options
elseif(LOSCFG_PLATFORM_STM32F072_Nucleo)
    set(TIMER_TYPE arm/timer/arm_cortex_m)
    set(LITEOS_CMACRO_TEST STM32F072xB)
    set(HAL_DRIVER_TYPE STM32F0xx_HAL_Driver)
endif()

set(HWI_SRC         hw/${HWI_TYPE})
set(TIMER_SRC       hw/${TIMER_TYPE})
set(HRTIMER_SRC     hw/${HRTIMER_TYPE})
set(NET_SRC         bsp/net/${NET_TYPE})
set(UART_SRC        drivers/uart/${UART_TYPE})
set(USB_SRC         bsp/usb/${USB_TYPE})
set(HAL_DRIVER_SRC  drivers/${HAL_DRIVER_TYPE})
set(LITEOS_PLATFORM ${LOSCFG_PLATFORM})

set(PLATFORM_INCLUDE 
    "${CMAKE_SOURCE_DIR}/targets/bsp/common"
    "${CMAKE_SOURCE_DIR}/targets/bsp/common/pm"
    "${CMAKE_SOURCE_DIR}/targets/bsp/hw/include"
    "${CMAKE_SOURCE_DIR}/targets/bsp/include"
    "${CMAKE_SOURCE_DIR}/targets/bsp/${UART_SRC}"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/include"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/Inc"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/include/asm"
    "${CMAKE_SOURCE_DIR}/arch/arm/cortex_m/cmsis"
    "${CMAKE_SOURCE_DIR}/lib/huawei_libc/time")

if("${LITEOS_PLATFORM}" STREQUAL "hi3516ev200")
    list(APPEND PLATFORM_INCLUDE
        "${CMAKE_SOURCE_DIR}/platform/bsp/board/${LITEOS_PLATFORM}/include/hisoc")
endif()

if(NOT CMAKE_HOST_UNIX)

    list(APPEND LITEOS_BASELIB sec base init bsp c m osdepends)
    
    if(("${LITEOS_CPU_TYPE}" STREQUAL "cortex-a7") OR ("${LITEOS_CPU_TYPE}" STREQUAL "cortex-a9"))
        list(APPEND LITEOS_BASELIB csysdeps)
    endif()

    if(LOSCFG_SHELL)
        list(APPEND LITEOS_BASELIB shell)
    endif()

    if(LOSCFG_COMPAT_CMSIS)
        list(APPEND LITEOS_BASELIB cmsis)
    endif()

    if(LOSCFG_COMPAT_POSIX)
        list(APPEND LITEOS_BASELIB posix)
    endif()

    if(LOSCFG_KERNEL_TICKLESS)
        list(APPEND LITEOS_BASELIB tickless)
    endif()

    if(LOSCFG_KERNEL_CPUP)
        list(APPEND LITEOS_BASELIB cpup)
    endif()

    if(LOSCFG_KERNEL_TRACE)
        list(APPEND LITEOS_BASELIB trace)
    endif()

    if(LOSCFG_KERNEL_CPPSUPPORT)
        list(APPEND LITEOS_BASELIB cppsupport)
    endif()

    if(LOSCFG_COMPONENTS_FS)
        list(APPEND LITEOS_BASELIB fs)
    endif()

    if(LOSCFG_COMPONENTS_GUI)
        list(APPEND LITEOS_BASELIB gui)
    endif()

    if(LOSCFG_COMPONNETS_NET_AT)
        list(APPEND LITEOS_BASELIB at_device at_frame)
    endif()

    if(LOSCFG_COMPONENTS_CONNECTIVITY_NB_IOT)
        list(APPEND LITEOS_BASELIB nb_iot)
    endif()

    if(LOSCFG_COMPONENTS_SENSORHUB)
        list(APPEND LITEOS_BASELIB sensorhub)
    endif()

    if(LOSCFG_DEMOS_SENSORHUB)
        list(APPEND LITEOS_BASELIB sensorhub_demo)
    endif()

    if(LOSCFG_COMPONENTS_NET_LWIP)
        list(APPEND LITEOS_BASELIB lwip)
    endif()

    if(LOSCFG_COMPONENTS_SECURITY_MBEDTLS)
        list(APPEND LITEOS_BASELIB mbedtls)
    endif()

    if(LOSCFG_COMPONENTS_LIB_CJSON)
        list(APPEND LITEOS_BASELIB cjson)
    endif()

    if(LOSCFG_COMPONENTS_LOG)
        list(APPEND LITEOS_BASELIB log)
    endif()

    if(LOSCFG_COMPONENTS_CONNECTIVITY_MQTT)
        list(APPEND LITEOS_BASELIB mqtt)
    endif()

    if(LOSCFG_COMPONENTS_CONNECTIVITY_LWM2M)
        list(APPEND LITEOS_BASELIB lwm2m)
    endif()

    if(LOSCFG_COMPONENTS_CONNECTIVITY_ATINY_MQTT)
        list(APPEND LITEOS_BASELIB atiny_mqtt)
    endif()

    if(LOSCFG_COMPONENTS_CONNECTIVITY_ATINY_LWM2M)
        list(APPEND LITEOS_BASELIB atiny_lwm2m)
    endif()

    if(LOSCFG_COMPONENTS_NET_SAL)
        list(APPEND LITEOS_BASELIB sal)
    endif()

    if(LOSCFG_DEMOS_KERNEL)
        list(APPEND LITEOS_BASELIB kernel_demo)
    endif()

    if(LOSCFG_DEMOS_FS)
        list(APPEND LITEOS_BASELIB fs_demo)
    endif()

    if(LOSCFG_DEMOS_GUI)
        list(APPEND LITEOS_BASELIB gui_demo)
    endif()

    if(LOSCFG_DEMOS_AGENT_TINY_MQTT)
        list(APPEND LITEOS_BASELIB agenttiny_mqtt)
    endif()

    if(LOSCFG_DEMOS_AGENT_TINY_LWM2M)
        list(APPEND LITEOS_BASELIB agenttiny_lwm2m)
    endif()

    if(LOSCFG_DEMOS_DTLS_SERVER)
        list(APPEND LITEOS_BASELIB dtls_server)
    endif()

    if(LOSCFG_DEMOS_NBIOT_WITHOUT_ATINY)
        list(APPEND LITEOS_BASELIB nbiot_without_atiny)
    endif()

    if(LOSCFG_DEMOS_IPV6_CLIENT)
        list(APPEND LITEOS_BASELIB ipv6_client)
    endif()

    if(LOSCFG_DEMOS_LMS)
        list(APPEND LITEOS_BASELIB lms_demo)
    endif()

    if(LOSCFG_DEMOS_TRACE)
        list(APPEND LITEOS_BASELIB trace_demo)
    endif()

    if(LOSCFG_DEMOS_AI)
        list(APPEND LITEOS_BASELIB ai_demo)
    endif()
    
endif()

if(LOSCFG_DEMOS_AI)
    if(LOSCFG_ARCH_ARM_CORTEX_A)
        list(APPEND LITEOS_BASELIB cortex-a-nnacl)
    elseif(LOSCFG_ARCH_ARM_CORTEX_M)
        list(APPEND LITEOS_BASELIB cortex-m-nnacl)
    endif()
endif()

if(LOSCFG_KERNEL_LMS)
    list(APPEND LITEOS_BASELIB lms)
endif()

add_subdirectory(bsp)
add_subdirectory(${LITEOS_PLATFORM})

cmake_minimum_required(VERSION 3.20.0 FATAL_ERROR)

# Set up compiler and mcu arch 
set(COMPILER_TYPE "arm-none-eabi") # options: 'armcc' or 'arm-none-eabi'
set(MCU_ARCH_TYPE "cortex_m4") # options: 'cortex_m0', 'cortex_m3' ...
set(MCU_MFPU_TYPE "default") # options: 'sp', 'dp', 'none', 'default'

# Set up flasher config
#set(FLASHER_TYPE_NAME "jlink")
#set(FLASHER_PORT_TYPE "swd")
#set(FLASHER_MCPU_NAME "STM32H750VB")

# Include toolchain and flasher config
include(${CMAKE_SOURCE_DIR}/cmake/toolchain/${COMPILER_TYPE}/${MCU_ARCH_TYPE}.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/utils/kconfig.cmake)
#include(${CMAKE_SOURCE_DIR}/cmake/flasher/${FLASHER_TYPE_NAME}-${FLASHER_PORT_TYPE}.cmake)

# Set up project name
set(PRJ_NAME "ys_liteos")

# Set up the project
project(${PRJ_NAME}
    VERSION "0.1.0"
    LANGUAGES C ASM CXX)

# Include kconfig
kconfig_include(.config 
    OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
    OUTPUT_HEADER_NAME "menuconfig.h")

# Global config
set(_LITEOS_BASE_INC)
set(_LITEOS_BASE_CMACRO)
set(_LITEOS_BASE_CFLAGS)
set(_LITEOS_BASE_ASMFLAGS)
set(_LITEOS_BASE_CXXFLAGS)
set(_LITEOS_BASE_LDFLAGS)
set(_LITEOS_BASE_LIB)

list(APPEND _LITEOS_BASE_INC 
    kernel/include)

set(LITEOS_PLATFORM_MENUCONFIG_H "${CMAKE_SOURCE_DIR}/targets/${LOSCFG_PLATFORM}/include/menuconfig.h")
configure_file(${CMAKE_CURRENT_BINARY_DIR}/menuconfig.h "${LITEOS_PLATFORM_MENUCONFIG_H}" COPYONLY)
list(APPEND _LITEOS_BASE_CFLAGS "-include \"${LITEOS_PLATFORM_MENUCONFIG_H}\"")

if(LOSCFG_COMPILER_HIMIX_32 OR LOSCFG_COMPILER_HIMIX210_64 OR LOSCFG_COMPILER_HCC_64 OR LOSCFG_COMPILER_XTENSA_32)
    list(APPEND _LITEOS_BASE_CMACRO __COMPILER_HUAWEILITEOS__)
endif()

if(LOSCFG_COMPILER_XTENSA_32)
    list(APPEND _LITEOS_BASE_CMACRO __COMPILER_XTENSA__)
endif()

list(APPEND _LITEOS_BASE_CMACRO
    SECUREC_IN_KERNEL=0
    __LITEOS__
    _ALL_SOURCE
    __ASSEMBLY__)

list(APPEND _LITEOS_BASE_CFLAGS
    -Wall -Werror)

list(APPEND _LITEOS_BASE_LIB gcc)

if((NOT LOSCFG_COMPILER_ARM_NONE_EABI) AND (NOT LOSCFG_COMPILER_RISCV_UNKNOWN) AND (NOT LOSCFG_COMPILER_XTENSA_32))
    list(APPEND _LITEOS_BASE_LIB gcc_eh)
endif()

list(APPEND _LITEOS_BASE_LDFLAGS
    "targets/${LITEOS_PLATFORM}/board.ld")

include_directories("${_LITEOS_BASE_INC}")
add_compile_definitions("${_LITEOS_BASE_CMACRO}")
add_compile_options("${_LITEOS_BASE_CFLAGS}")
add_link_options("${_LITEOS_BASE_LDFLAGS}")
link_libraries("${_LITEOS_BASE_LIB}")

# auto add subdirectory
file(GLOB sub_files RELATIVE "${CMAKE_CURRENT_LIST_DIR}" "${CMAKE_CURRENT_LIST_DIR}/*")
foreach(file_name ${sub_files})
    if(IS_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/${file_name}")
        if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/${file_name}/CMakeLists.txt")
            add_subdirectory("${file_name}")
        endif()
    endif()
endforeach()

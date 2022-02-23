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
include(config.cmake)

# auto add subdirectory
file(GLOB sub_files RELATIVE "${CMAKE_CURRENT_LIST_DIR}" "${CMAKE_CURRENT_LIST_DIR}/*")
foreach(file_name ${sub_files})
    if(IS_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/${file_name}")
        if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/${file_name}/CMakeLists.txt")
            add_subdirectory("${file_name}")
        endif()
    endif()
endforeach()

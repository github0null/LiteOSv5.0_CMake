
set(MODULE_NAME ${LOSCFG_ARCH_CPU})

file(GLOB_RECURSE C_SRCS   LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_LIST_DIR}" "*.c")
file(GLOB_RECURSE ASM_SRCS LIST_DIRECTORIES false RELATIVE "${CMAKE_CURRENT_LIST_DIR}" "*.S")

if(NOT LOSCFG_FPB_ENABLE)
    list(FILTER C_SRCS EXCLUDE REGEX "src/fpb\\.c")
endif()

if(NOT LOSCFG_APC_ENABLE)
    list(FILTER C_SRCS EXCLUDE REGEX "src/mpu\\.c")
endif()

add_library(${MODULE_NAME} STATIC
    ${C_SRCS}
    ${ASM_SRCS})

# private

target_include_directories(${MODULE_NAME} PRIVATE
    ${CMAKE_SOURCE_DIR}/kernel/base/include
    ${CMAKE_SOURCE_DIR}/kernel/extended/include)

# public 

target_include_directories(${MODULE_NAME} PUBLIC
    ${CMAKE_SOURCE_DIR}/arch/arm/cortex_m/include)

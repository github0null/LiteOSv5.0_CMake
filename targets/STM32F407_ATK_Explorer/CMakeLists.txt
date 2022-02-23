
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

set(C_SRCS)
set(ASM_SRCS)

list(APPEND C_SRCS 
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/os_adapt/os_adapt.c"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/Src/main.c"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/Src/system_stm32f4xx.c"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/Src/usart.c"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/Src/tim.c"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/Src/sys_init.c"
    "${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/Src/user_task.c")

list(APPEND ASM_SRCS 
    los_startup_gcc.S)

add_executable(${MODULE_NAME}
    ${C_SRCS}
    ${ASM_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/include"
    "${CMAKE_SOURCE_DIR}/targets/bsp/drivers/STM32F4xx_HAL_Driver/Inc"
    "${CMAKE_SOURCE_DIR}/targets/bsp/drivers/STM32F4xx_HAL_Driver/Inc/Legacy")

target_compile_definitions(${MODULE_NAME} PRIVATE
    USE_HAL_DRIVER
    STM32F407xx
    NDEBUG
    __LITEOS__
    _ALL_SOURCE)

target_link_libraries(${MODULE_NAME} ${LITEOS_BASELIB})

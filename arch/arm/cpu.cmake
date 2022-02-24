if(LOSCFG_ARCH_ARM_CORTEX_M)
    include(${CMAKE_SOURCE_DIR}/arch/arm/cortex_m/cpu.cmake)
else()
    include(${CMAKE_SOURCE_DIR}/arch/arm/cortex_a_r/cpu.cmake)
endif()

list(APPEND LITEOS_BASELIB ${LOSCFG_ARCH_CPU})

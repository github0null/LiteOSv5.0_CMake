
set(MODULE_NAME posix)

set(C_SRCS)
set(C_SRCS_DIRS)

if(LOSCFG_COMPAT_POSIX)
    list(APPEND C_SRCS_DIRS 
        pthread mq sched tzdst misc
        libc/src/exit libc/src/prng libc/src/multibyte
        libc/src/env libc/src/linux libc/src/process 
        libc/src/legacy libc/src/thread)
    list(APPEND C_SRCS time/time64.c time/timer.c)
endif()

foreach(_dir_name "${C_SRCS_DIRS}")
    aux_source_directory("${_dir_name}" C_SRCS)
endforeach()

set(ASM_SRCS)

if("${LITEOS_CPU_TYPE}" STREQUAL "cortex-a7")
    file(GLOB_RECURSE ASM_SRCS 
        LIST_DIRECTORIES false 
        RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "arch/${ARCH_LOCAL}/cortex-a7/*.S")
elseif("${LITEOS_CPU_TYPE}" STREQUAL "cortex-a9")
    file(GLOB_RECURSE ASM_SRCS 
        LIST_DIRECTORIES false 
        RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "arch/${ARCH_LOCAL}/cortex-a7/*.S")
elseif("${LITEOS_CPU_TYPE}" STREQUAL "riscv")
    file(GLOB_RECURSE ASM_SRCS 
        LIST_DIRECTORIES false 
        RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "arch/${ARCH_LOCAL}/*.S")
endif()

add_library(${MODULE_NAME} OBJECT 
    ${C_SRCS}
    ${ASM_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/lib/huawei_libc/pthread"
    "${CMAKE_SOURCE_DIR}/lib/huawei_libc/errno"
    "${CMAKE_SOURCE_DIR}/lib/huawei_libc/tzdst"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/include"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/internal"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/time")

set(LITEOS_INCLUDE)
set(LITEOS_CXXINCLUDE)

set(LITEOS_CMACRO)
set(LITEOS_ASMMACRO)
set(LITEOS_CXXMACRO)

set(LITEOS_CFLAGS)
set(LITEOS_ASMFLAGS)
set(LITEOS_CXXFLAGS)
set(LITEOS_LDFLAGS)
set(LITEOS_LIB)

set(LITEOS_COPTS_BASE)
set(LITEOS_CXXOPTS_BASE)
set(LITEOS_GCOV_OPTS)
set(LITEOS_LD_OPTS)

list(APPEND LITEOS_INCLUDE 
    "${CMAKE_SOURCE_DIR}/kernel/base/include"
    "${CMAKE_SOURCE_DIR}/kernel/include")

set(LITEOS_PLATFORM_MENUCONFIG_H "${CMAKE_SOURCE_DIR}/targets/${LOSCFG_PLATFORM}/include/menuconfig.h")
configure_file(${CMAKE_CURRENT_BINARY_DIR}/menuconfig.h "${LITEOS_PLATFORM_MENUCONFIG_H}" COPYONLY)
list(APPEND LITEOS_CFLAGS -include "${LITEOS_PLATFORM_MENUCONFIG_H}")

if(LOSCFG_COMPILER_HIMIX_32 OR LOSCFG_COMPILER_HIMIX210_64 OR LOSCFG_COMPILER_HCC_64 OR LOSCFG_COMPILER_XTENSA_32)
    list(APPEND LITEOS_CMACRO __COMPILER_HUAWEILITEOS__)
endif()

if(LOSCFG_COMPILER_XTENSA_32)
    list(APPEND LITEOS_CMACRO __COMPILER_XTENSA__)
endif()

list(APPEND LITEOS_CMACRO
    SECUREC_IN_KERNEL=0
    __LITEOS__
    _ALL_SOURCE)

list(APPEND LITEOS_LIB gcc)

if((NOT LOSCFG_COMPILER_ARM_NONE_EABI) AND (NOT LOSCFG_COMPILER_RISCV_UNKNOWN) AND (NOT LOSCFG_COMPILER_XTENSA_32))
    list(APPEND LITEOS_LIB gcc_eh)
endif()

set(AS_OBJS_LIBC_FLAGS -D__ASSEMBLY__)
set(WARNING_AS_ERROR -Wall -Werror)

# Tools && Debug Option Begin

if(LOSCFG_NULL_ADDRESS_PROTECT)
    list(APPEND LITEOS_CMACRO LOSCFG_NULL_ADDRESS_PROTECT)
endif()

# options

if(LOSCFG_CC_STACKPROTECTOR)
    set(LITEOS_SSP -fstack-protector --param ssp-buffer-size=4)
elseif(LOSCFG_CC_STACKPROTECTOR_STRONG)
    set(LITEOS_SSP -fstack-protector-strong)
elseif(LOSCFG_CC_STACKPROTECTOR_ALL)
    set(LITEOS_SSP -fstack-protector-all)
endif()

list(APPEND LITEOS_CMACRO LOSCFG_KERNEL_CPP_EXCEPTIONS_SUPPORT)
list(APPEND LITEOS_CXXMACRO LOSCFG_KERNEL_CPP_EXCEPTIONS_SUPPORT)

set(LITEOS_COMMON_OPTS -fno-pic -fno-builtin -freg-struct-return
    -funsigned-char -ffunction-sections -fdata-sections
    ${WARNING_AS_ERROR} ${LITEOS_SSP} -Wformat=2)

if(NOT LOSCFG_COMPILER_CLANG)
    list(APPEND LITEOS_COMMON_OPTS -Wtrampolines)
endif()

if(LOSCFG_LIB_LIBC)
    list(APPEND LITEOS_COMMON_OPTS -nostdinc -nostdlib)
    list(APPEND LITEOS_ASMFLAGS ${AS_OBJS_LIBC_FLAGS})
    list(APPEND LITEOS_LD_OPTS -Wl,-nostdlib)
endif()

set(LITEOS_COPTS_BASE "${LITEOS_COMMON_OPTS}")

# Anonymous structs and unions are supported on c11; while gcc supports those features as extension
# which is turn on for default. As for Clang, if choose c99, -std=gnu99 should be used.
if(LOSCFG_COMPILER_CLANG)
    list(APPEND LITEOS_COPTS_BASE -std=gnu99)
else()
    list(APPEND LITEOS_COPTS_BASE -std=c99)
endif()

# -Wpointer-arith will treat the size of a void or of a function as 1.
# -Wstrict-prototypes will warn if a function is defined without specifying the argument types.
# -pipe will use pipes, save compilation time
list(APPEND LITEOS_COPTS_BASE -Wpointer-arith -Wstrict-prototypes -fno-exceptions -pipe)

if(LOSCFG_COMPILER_GCC)
    list(APPEND LITEOS_COPTS_BASE -fno-aggressive-loop-optimizations)
endif()

# clang support -fno-omit-frame-pointer
if(LOSCFG_BACKTRACE_WITH_FP)
    list(APPEND LITEOS_COPTS_BASE -fno-omit-frame-pointer)
endif()

if(NOT LOSCFG_COMPILER_XTENSA_32)
    list(APPEND LITEOS_COPTS_BASE -Winvalid-pch)
endif()

if(NOT LOSCFG_ARCH_RISCV)
    list(APPEND LITEOS_COPTS_BASE -fno-short-enums)
endif()

set(LITEOS_CXXOPTS_BASE -std=c++11 -nostdinc++ -fexceptions -fpermissive
    -fno-use-cxa-atexit -frtti ${LITEOS_COMMON_OPTS})

if(LOSCFG_BACKTRACE_WITH_FP)
    list(APPEND LITEOS_CXXOPTS_BASE -fno-omit-frame-pointer)
endif()

if(NOT LOSCFG_COMPILER_XTENSA_32)
    list(APPEND LITEOS_CXXOPTS_BASE -Winvalid-pch)
endif()

if(LOSCFG_LLTREPORT)
    list(APPEND LITEOS_GCOV_OPTS -fprofile-arcs -ftest-coverage -Wno-maybe-uninitialized)
    list(APPEND LITEOS_BASELIB gcov)
endif()

list(APPEND LITEOS_LD_OPTS -Wl,-nostartfiles -Wl,-static)

if(LOSCFG_ARCH_CORTEX_M0)
    list(APPEND LITEOS_COPTS_BASE -fshort-enums)
endif()

if(LOSCFG_DEMOS_AI)
    list(APPEND LITEOS_LD_PATH 
        -L${CMAKE_SOURCE_DIR}/components/ai/nnacl_lib)
endif()

if(LOSCFG_KERNEL_LMS)
    if(LOSCFG_ARCH_ARM_CORTEX_M)
        list(APPEND LITEOS_LD_PATH 
            -L${CMAKE_SOURCE_DIR}/kernel/extended/lms/cortex_m/${LOSCFG_ARCH_CPU})
    else()
        list(APPEND LITEOS_LD_PATH 
            -L${CMAKE_SOURCE_DIR}/kernel/extended/lms/cortex_a_r)
    endif()
endif()

list(APPEND LITEOS_CXXINCLUDE
    "${CMAKE_SOURCE_DIR}/kernel/base/include"
    "${CMAKE_SOURCE_DIR}/compat/posix/include"
    "${CMAKE_SOURCE_DIR}/lib/libc/include"
    "${CMAKE_SOURCE_DIR}/fs/include"
    "${CMAKE_SOURCE_DIR}/kernel/include")

# add sub config

include(arch/cpu.cmake)
include(targets/targets.cmake)
include(lib/api.cmake)
include(compat/api.cmake)
include(shell/api.cmake)
include(components/components.cmake)

set(LOSCFG_TOOLS_DEBUG_INCLUDE 
    ${LITEOS_SHELL_INCLUDE} 
    ${LITEOS_UART_INCLUDE})

list(APPEND LITEOS_INCLUDE 
    ${LITEOS_KERNEL_INCLUDE} ${LITEOS_PLATFORM_INCLUDE}
    ${LITEOS_LIB_INCLUDE} ${LITEOS_FS_INCLUDE}
    ${LITEOS_EXTKERNEL_INCLUDE}
    ${LITEOS_COMPAT_INCLUDE} ${LITEOS_DRIVERS_INCLUDE}
    ${LOSCFG_TOOLS_DEBUG_INCLUDE} ${LITEOS_NET_INCLUDE}
    ${COMPONENTS_INCLUDE} ${DEMOS_INCLUDE})

#list(APPEND LITEOS_LD_OPTS "targets/${LITEOS_PLATFORM}/board.ld")

if(LOSCFG_USING_BOARD_LD)
    list(APPEND LITEOS_LD_OPTS -T ${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/liteos.ld)
else()
    list(APPEND LITEOS_LD_OPTS -T ${CMAKE_SOURCE_DIR}/liteos.ld)
endif()

set(LITEOS_LD_PATH
    -L${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM} 
    -L${CMAKE_SOURCE_DIR}/tools/build)

# apply config

include_directories(${LITEOS_INCLUDE})
add_compile_definitions(${LITEOS_CMACRO})
add_compile_options(${LITEOS_CFLAGS} ${LITEOS_GCOV_OPTS})
add_link_options(${LITEOS_LDFLAGS} ${LITEOS_LD_OPTS})

# apply for language

include_directories("$<$<COMPILE_LANGUAGE:CXX>:${LITEOS_CXXINCLUDE}>")
add_compile_definitions("$<$<COMPILE_LANGUAGE:ASM>:${LITEOS_ASMMACRO}>")
add_compile_definitions("$<$<COMPILE_LANGUAGE:CXX>:${LITEOS_CXXMACRO}>")
add_compile_options("$<$<COMPILE_LANGUAGE:C>:${LITEOS_COPTS_BASE}>")
add_compile_options("$<$<COMPILE_LANGUAGE:ASM>:${LITEOS_ASMFLAGS}>")
add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:${LITEOS_CXXFLAGS};${LITEOS_CXXOPTS_BASE}>")

set(LITEOS_BASE_INCLUDE)
set(LITEOS_BASE_CXXINCLUDE)

set(LITEOS_BASE_CMACRO)
set(LITEOS_BASE_ASMMACRO)
set(LITEOS_BASE_CXXMACRO)

set(LITEOS_BASE_CFLAGS)
set(LITEOS_BASE_ASMFLAGS)
set(LITEOS_BASE_CXXFLAGS)
set(LITEOS_BASE_LDFLAGS)
set(LITEOS_BASE_LIB)

set(LITEOS_GCOV_OPTS)

list(APPEND LITEOS_BASE_INCLUDE 
    "${CMAKE_SOURCE_DIR}/kernel/base/include"
    "${CMAKE_SOURCE_DIR}/kernel/include")

set(LITEOS_PLATFORM_MENUCONFIG_H "${CMAKE_SOURCE_DIR}/targets/${LOSCFG_PLATFORM}/include/menuconfig.h")
configure_file(${CMAKE_CURRENT_BINARY_DIR}/menuconfig.h "${LITEOS_PLATFORM_MENUCONFIG_H}" COPYONLY)
list(APPEND LITEOS_BASE_CFLAGS -include "${LITEOS_PLATFORM_MENUCONFIG_H}")

if(LOSCFG_COMPILER_HIMIX_32 OR LOSCFG_COMPILER_HIMIX210_64 OR LOSCFG_COMPILER_HCC_64 OR LOSCFG_COMPILER_XTENSA_32)
    list(APPEND LITEOS_BASE_CMACRO __COMPILER_HUAWEILITEOS__)
endif()

if(LOSCFG_COMPILER_XTENSA_32)
    list(APPEND LITEOS_BASE_CMACRO __COMPILER_XTENSA__)
endif()

list(APPEND LITEOS_BASE_CMACRO
    SECUREC_IN_KERNEL=0
    __LITEOS__
    _ALL_SOURCE)

list(APPEND LITEOS_BASE_ASMMACRO
    __ASSEMBLY__)

list(APPEND LITEOS_BASE_CFLAGS
    -Wall -Werror)

list(APPEND LITEOS_BASE_LIB gcc)

if((NOT LOSCFG_COMPILER_ARM_NONE_EABI) AND (NOT LOSCFG_COMPILER_RISCV_UNKNOWN) AND (NOT LOSCFG_COMPILER_XTENSA_32))
    list(APPEND LITEOS_BASE_LIB gcc_eh)
endif()

#list(APPEND LITEOS_BASE_LDFLAGS "targets/${LITEOS_PLATFORM}/board.ld")

# Tools && Debug Option Begin

if(LOSCFG_NULL_ADDRESS_PROTECT)
    list(APPEND LITEOS_BASE_CMACRO LOSCFG_NULL_ADDRESS_PROTECT)
endif()

# options

if(LOSCFG_CC_STACKPROTECTOR)
    set(LITEOS_SSP -fstack-protector --param ssp-buffer-size=4)
elseif(LOSCFG_CC_STACKPROTECTOR_STRONG)
    set(LITEOS_SSP -fstack-protector-strong)
elseif(LOSCFG_CC_STACKPROTECTOR_ALL)
    set(LITEOS_SSP -fstack-protector-all)
endif()

list(APPEND LITEOS_BASE_CMACRO LOSCFG_KERNEL_CPP_EXCEPTIONS_SUPPORT)
list(APPEND LITEOS_BASE_CXXMACRO LOSCFG_KERNEL_CPP_EXCEPTIONS_SUPPORT)

set(LITEOS_COMMON_OPTS -fno-pic -fno-builtin -freg-struct-return
    -funsigned-char -ffunction-sections -fdata-sections
    ${WARNING_AS_ERROR} ${LITEOS_SSP} -Wformat=2)

if(NOT LOSCFG_COMPILER_CLANG)
    list(APPEND LITEOS_COMMON_OPTS -Wtrampolines)
endif()

if(LOSCFG_LIB_LIBC)
    list(APPEND LITEOS_COMMON_OPTS -nostdinc -nostdlib)
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

list(APPEND LITEOS_LD_OPTS -nostartfiles -static --gc-sections)

if(LOSCFG_ARCH_CORTEX_M0)
    list(APPEND LITEOS_COPTS_BASE -fshort-enums)
endif()

set(LITEOS_LD_PATH
    -L${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM} 
    -L${CMAKE_SOURCE_DIR}/tools/build)

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

if(LOSCFG_USING_BOARD_LD)
    list(APPEND LITEOS_BASE_LDFLAGS -T ${CMAKE_SOURCE_DIR}/targets/${LITEOS_PLATFORM}/liteos.ld)
else()
    list(APPEND LITEOS_BASE_LDFLAGS -T ${CMAKE_SOURCE_DIR}/liteos.ld)
endif()

list(APPEND LITEOS_BASE_CXXINCLUDE
    "${CMAKE_SOURCE_DIR}/kernel/base/include"
    "${CMAKE_SOURCE_DIR}/compat/posix/include"
    "${CMAKE_SOURCE_DIR}/lib/libc/include"
    "${CMAKE_SOURCE_DIR}/fs/include"
    "${CMAKE_SOURCE_DIR}/kernel/include")

# apply config

include_directories("${LITEOS_BASE_INCLUDE}")
add_compile_definitions("${LITEOS_BASE_CMACRO}")
add_compile_options("${LITEOS_BASE_CFLAGS} ${LITEOS_GCOV_OPTS}")
add_link_options("${LITEOS_BASE_LDFLAGS}")
link_libraries("${LITEOS_BASE_LIB}")

include_directories($<$<COMPILE_LANGUAGE:CXX>:${LITEOS_BASE_CXXINCLUDE}>)
add_compile_definitions($<$<COMPILE_LANGUAGE:ASM>:${LITEOS_BASE_ASMMACRO}>)
add_compile_definitions($<$<COMPILE_LANGUAGE:CXX>:${LITEOS_BASE_CXXMACRO}>)
add_compile_options($<$<COMPILE_LANGUAGE:ASM>:${LITEOS_BASE_ASMFLAGS}>)
add_compile_options($<$<COMPILE_LANGUAGE:CXX>:${LITEOS_BASE_CXXFLAGS}>)

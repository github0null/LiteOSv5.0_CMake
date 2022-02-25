
set(MODULE_NAME "c")

set(C_SRCS)
set(C_SRCS_DIRS)

list(APPEND C_SRCS_DIRS 
    src/errno src/string src/stdlib src/internal 
    src/time src/misc src/locale src/ctype 
    src/temp src/fcntl src/signal src/network 
    src/unistd src/complex src/termios)

list(APPEND C_SRCS_DIRS 
    ../huawei_libc/errno ../huawei_libc/string 
    ../huawei_libc/stdlib ../huawei_libc/signal)

if(LOSCFG_LIB_STDIO)
    list(APPEND C_SRCS_DIRS src/stdio ../huawei_libc/stdio)
endif()

foreach(_dir_name ${C_SRCS_DIRS})
    aux_source_directory("${_dir_name}" C_SRCS)
endforeach()

list(APPEND C_SRCS 
    ../huawei_libc/time/time.c 
    src/prng/rand.c)

if(NOT LOSCFG_LIB_STDIO)
    list(APPEND C_SRCS src/stdio/__uflow.c src/stdio/__toread.c)
endif()

set(ASM_SRCS)

file(GLOB_RECURSE ASM_SRCS 
    LIST_DIRECTORIES false 
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" 
    "src/string/${ARCH_LOCAL}/*.s")

list(FILTER ASM_SRCS EXCLUDE REGEX "src/string/${ARCH_LOCAL}/.*\.S")

if(NOT LOSCFG_ARCH_ARM_CORTEX_M)
    file(GLOB_RECURSE ASM_SRCS 
        LIST_DIRECTORIES false 
        RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" 
        "src/string/${ARCH_LOCAL}/*.S")
endif()
    
if("${LITEOS_CPU_TYPE}" STREQUAL "cortex-a7")
    list(REMOVE_ITEM C_SRCS
        "src/string/memcpy.c"
        "src/string/memset.c"
        "src/string/strcmp.c"
        "src/string/memcmp.c")
elseif("${LITEOS_CPU_TYPE}" STREQUAL "cortex-a9")
    list(REMOVE_ITEM C_SRCS
        "src/string/memcpy.c"
        "src/string/memset.c"
        "src/string/strcmp.c"
        "src/string/memcmp.c")
elseif("${LITEOS_CPU_TYPE}" STREQUAL "riscv")
    list(REMOVE_ITEM C_SRCS
        "src/string/memset.c"
        "src/string/strcmp.c"
        "src/string/memcpy.c")
endif()

add_library(${MODULE_NAME} STATIC 
    ${C_SRCS}
    ${ASM_SRCS})

target_include_directories(${MODULE_NAME} BEFORE PRIVATE
    "${CMAKE_SOURCE_DIR}/lib/libc/src/include"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/internal"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/crypt"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/ctype"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/dirent"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/errno"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/ipc"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/locale"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/math"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/multibyte"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/networknetwork"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/passwd"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/prng"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/process"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/regex"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/search"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/time"
    "${CMAKE_SOURCE_DIR}/drivers/random/dev/random"
    "${CMAKE_SOURCE_DIR}/lib/huawei_libc/pthread"
    "${CMAKE_SOURCE_DIR}/lib/huawei_libc/tzdst")

if(LOSCFG_LLTSER)
    target_include_directories(${MODULE_NAME} BEFORE PRIVATE
        "${CMAKE_SOURCE_DIR}/tools/gcov_ser")
endif()

target_compile_options(${MODULE_NAME} PRIVATE -Wno-maybe-uninitialized)

add_subdirectory(src/math)

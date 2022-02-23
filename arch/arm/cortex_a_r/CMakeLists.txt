
set(MODULE_NAME ${LOSCFG_ARCH_CPU})

set(C_SRCS
    src/canary.c
    src/cpu.c
    src/fault.c
    src/mmu.c
    src/task.c)

file(GLOB ASM_SRCS LIST_DIRECTORIES false RELATIVE "src" "*.S")

if("${LITEOS_ARM_ARCH}_" STREQUAL "-march=armv7-a_")
    file(GLOB _srcs_ LIST_DIRECTORIES false RELATIVE "src/armv7a" "*.S")
    list(APPEND ASM_SRCS ${_srcs_})
endif()

if(NOT LOSCFG_APC_ENABLE)
    list(FILTER C_SRCS EXCLUDE REGEX "src/mmu\\.c")
endif()

add_library(${MODULE_NAME} OBJECT
    ${C_SRCS}
    ${ASM_SRCS})

#
# public options
#
target_include_directories(${MODULE_NAME} PUBLIC
    "${CMAKE_SOURCE_DIR}/kernel/extended/include")

target_compile_options(${MODULE_NAME} PUBLIC 
    "-mcpu=${LOSCFG_ARCH_CPU}${EXTENSION}")

#
# private options
#
target_include_directories(${MODULE_NAME} PRIVATE
    "")

target_compile_options(${MODULE_NAME} PRIVATE 
    ${LITEOS_GCOV_OPTS})

if(LOSCFG_GDB)
    target_compile_options(${MODULE_NAME} PRIVATE 
        ${AS_OBJS_LIBC_FLAGS})
endif()

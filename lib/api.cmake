set(ARCH_LOCAL)

set(LITEOS_LIBC_INCLUDE ${CMAKE_SOURCE_DIR}/lib/libsec/include)

if(LOSCFG_LIB_LIBC)
    if(LOSCFG_ARCH_ARM_AARCH32)
        set(ARCH_LOCAL arm)
    elseif(LOSCFG_ARCH_ARM_AARCH64)
        set(ARCH_LOCAL aarch64)
    elseif(LOSCFG_ARCH_RISCV_RV32IM)
        set(ARCH_LOCAL riscv32)
    endif()
    list(APPEND LITEOS_LIBC_INCLUDE
        ${CMAKE_SOURCE_DIR}/lib/libc/arch/${ARCH_LOCAL}
        ${CMAKE_SOURCE_DIR}/lib/libc/arch/generic
        ${CMAKE_SOURCE_DIR}/lib/huawei_libc/include
        ${CMAKE_SOURCE_DIR}/lib/libc/include)
endif()

if(LOSCFG_LIB_ZLIB)
    list(APPEND LITEOS_LIBC_INCLUDE ${CMAKE_SOURCE_DIR}/lib/zlib/include)
endif()

if(LOSCFG_KERNEL_CPPSUPPORT)
    list(APPEND LITEOS_BASELIB supc++ stdc++)
endif()

set(LITEOS_LIB_INCLUDE 
    ${LITEOS_LIBC_INCLUDE} ${LITEOS_LIBM_INCLUDE}
    ${LITEOS_ZLIB_INCLUDE} ${LITEOS_COMPILER_GCC_INCLUDE})

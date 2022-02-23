
set(MODULE_NAME "sec")

set(C_SRCS)

if(LOSCFG_LIB_LIBCMINI)
    set(C_SRCS
        src/memcpy_s.c
        src/memset_s.c
        src/strncpy_s.c
        src/vsnprintf_s.c
        src/secureprintoutput_a.c)
else()
    aux_source_directory(src C_SRCS)
endif()

add_library(${MODULE_NAME} OBJECT ${C_SRCS})

target_compile_definitions(${MODULE_NAME} PRIVATE
    SECUREC_HAVE_WCTOMB=0
    SECUREC_ENABLE_SPRINTF_FLOAT=0)

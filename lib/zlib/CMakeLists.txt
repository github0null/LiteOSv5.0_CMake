
set(MODULE_NAME z)

set(C_SRCS)

aux_source_directory(src C_SRCS)

add_library(${MODULE_NAME} OBJECT
    ${C_SRCS})

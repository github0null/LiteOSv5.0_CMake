
set(MODULE_NAME cmsis)

aux_source_directory(. C_SRCS)

add_library(${MODULE_NAME} STATIC
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PUBLIC
    .)

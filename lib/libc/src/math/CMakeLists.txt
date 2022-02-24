
set(MODULE_NAME "m")
set(C_SRCS)

aux_source_directory(. C_SRCS)

add_library(${MODULE_NAME} STATIC
    ${C_SRCS})

target_include_directories(${MODULE_NAME} BEFORE PRIVATE
    "${CMAKE_SOURCE_DIR}/lib/libc/src/include"
    "${CMAKE_SOURCE_DIR}/lib/libc/src/internal")

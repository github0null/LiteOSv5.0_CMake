
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

set(C_SRCS)
set(OBJ_SRCS)

aux_source_directory(. C_SRCS)

add_library(${MODULE_NAME} OBJECT
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/kernel/extended/include"
    "${CMAKE_SOURCE_DIR}/kernel/extended/include/lowpower"
    "${CMAKE_SOURCE_DIR}/kernel/base/core")

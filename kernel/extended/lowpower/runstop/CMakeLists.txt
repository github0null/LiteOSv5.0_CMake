
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

set(C_SRCS)
set(OBJ_SRCS)

aux_source_directory(src C_SRCS)

file(GLOB_RECURSE ASM_SRCS 
    LIST_DIRECTORIES false 
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "src/*.s")

add_library(${MODULE_NAME} STATIC
    ${C_SRCS}
    ${ASM_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/kernel/extended/include"
    "${CMAKE_SOURCE_DIR}/kernel/extended/include/lowpower")

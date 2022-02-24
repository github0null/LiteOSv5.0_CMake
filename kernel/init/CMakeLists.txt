
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

aux_source_directory(. C_SRCS)

add_library(${MODULE_NAME} STATIC
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/kernel/extended/include"
    "${CMAKE_SOURCE_DIR}/kernel/extended/dynload/include")

if(LOSCFG_PLATFORM_OSAPPINIT)
    target_include_directories(${MODULE_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/test/include")
endif()

if(LOSCFG_SHELL_MINI)
    target_include_directories(${MODULE_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/shell/mini/include")
endif()


get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

set(C_SRCS)

if(LOSCFG_SHELL_FULL_CAP)
    
    aux_source_directory(full/src/base C_SRCS)
    aux_source_directory(full/src/cmds C_SRCS)
    
    if(LOSCFG_SHELL_UART)
        list(APPEND C_SRCS full/src/base/porting/port_uart.c)
    endif()

    add_library(${MODULE_NAME} STATIC ${C_SRCS})

    target_include_directories(${MODULE_NAME} PRIVATE
        "${CMAKE_SOURCE_DIR}/include"
        "${CMAKE_SOURCE_DIR}/shell/full/include"
        "${CMAKE_SOURCE_DIR}/components/fs/ramfs"
        "${CMAKE_SOURCE_DIR}/components/fs/fat"
        "${CMAKE_SOURCE_DIR}/kernel/base/include")

    if(NOT LOSCFG_PLATFORM_OSAPPINIT)
        target_include_directories(${MODULE_NAME} PRIVATE
            "${CMAKE_SOURCE_DIR}/test/include")
    endif()
    
endif()


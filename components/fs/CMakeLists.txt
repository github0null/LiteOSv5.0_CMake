
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

set(LOCAL_DIRS)
set(LOCAL_INCLUDE)

# vfs
if(LOSCFG_COMPONENTS_FS_VFS)
    list(APPEND LOCAL_DIRS vfs)
    list(APPEND LOCAL_INCLUDE 
        "${CMAKE_SOURCE_DIR}/include"
        "${CMAKE_SOURCE_DIR}/include/fs"
        "${CMAKE_SOURCE_DIR}/lib/libc/include")
endif()

# fatfs
if(LOSCFG_COMPONENTS_FS_FATFS)
    list(APPEND LOCAL_DIRS fatfs 
        fatfs/ff13b/source 
        fatfs/ff13b/source/default)
    list(APPEND LOCAL_INCLUDE 
        "${CMAKE_SOURCE_DIR}/components/fs/fatfs/ff13b/source"
        "${CMAKE_SOURCE_DIR}/components/fs/fatfs/ff13b/source/default")
endif()

# Devfs
if(LOSCFG_COMPONENTS_FS_DEVFS)
    list(APPEND LOCAL_DIRS devfs)
    list(APPEND LOCAL_INCLUDE "${CMAKE_SOURCE_DIR}/include/fs")
endif()

# KiFs
if(LOSCFG_COMPONENTS_FS_KIFS)
    list(APPEND LOCAL_DIRS kifs)
    list(APPEND LOCAL_INCLUDE "${CMAKE_SOURCE_DIR}/include/fs")
endif()

# RamFs
if(LOSCFG_COMPONENTS_FS_RAMFS)
    list(APPEND LOCAL_DIRS ramfs)
    list(APPEND LOCAL_INCLUDE "${CMAKE_SOURCE_DIR}/include/fs")
endif()

# SpiFs
if(LOSCFG_COMPONENTS_FS_SPIFFS)
    list(APPEND LOCAL_DIRS spiffs spiffs/spiffs_git/src)
    list(APPEND LOCAL_INCLUDE 
        "${CMAKE_SOURCE_DIR}/components/fs/spiffs/spiffs_git/src"
        "${CMAKE_SOURCE_DIR}/components/fs/spiffs/spiffs_git/src/default")
endif()

set(C_SRCS)

foreach(_dir_name ${LOCAL_DIRS})
    aux_source_directory(${_dir_name} C_SRCS)
endforeach()

add_library(${MODULE_NAME} STATIC
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    ${LOCAL_INCLUDE})

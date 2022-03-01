
set(COMPONENTS_FS_INCLUDE)

if(LOSCFG_COMPONENTS_FS_FATFS)
    list(APPEND COMPONENTS_FS_INCLUDE 
        "${CMAKE_SOURCE_DIR}/components/fs/fatfs/ff13b/source"
        "${CMAKE_SOURCE_DIR}/components/fs/fatfs/ff13b/source/default")
endif()

if(LOSCFG_COMPONENTS_FS_SPIFFS)
    list(APPEND COMPONENTS_FS_INCLUDE 
        "${CMAKE_SOURCE_DIR}/components/fs/spiffs/spiffs_git/src"
        "${CMAKE_SOURCE_DIR}/components/fs/spiffs/spiffs_git/src/default")
endif()


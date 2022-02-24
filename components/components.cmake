
set(COMPONENTS_INCLUDE)

if(LOSCFG_COMPONENTS_CONNECTIVITY)
    include(${CMAKE_SOURCE_DIR}/components/connectivity/connectivity.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_CONNECTIVITY_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_FS)
    include(${CMAKE_SOURCE_DIR}/components/fs/fs.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_FS_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_GUI)
    include(${CMAKE_SOURCE_DIR}/components/gui/gui.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_GUI_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_SENSORHUB)
    include(${CMAKE_SOURCE_DIR}/components/sensorhub/sensorhub.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_SENSORHUB_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_NETWORK)
    include(${CMAKE_SOURCE_DIR}/components/net/net.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_NET_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_SECURITY)
    include(${CMAKE_SOURCE_DIR}/components/security/security.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_SECURITY_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_LIB)
    include(${CMAKE_SOURCE_DIR}/components/lib/lib.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_LIB_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_ATINY_LOG)
    include(${CMAKE_SOURCE_DIR}/components/log/atiny_log.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_ATINY_LOG_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_AI)
    include(${CMAKE_SOURCE_DIR}/components/ai/ai.cmake)
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_AI_INCLUDE})
endif()

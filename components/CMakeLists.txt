
if(LOSCFG_COMPONENTS_CONNECTIVITY)
    add_subdirectory(connectivity)
endif()

if(LOSCFG_COMPONENTS_FS)
    add_subdirectory(fs)
endif()

if(LOSCFG_COMPONENTS_GUI)
    add_subdirectory(gui)
endif()

if(LOSCFG_COMPONENTS_LIB)
    add_subdirectory(lib)
endif()

if(LOSCFG_COMPONENTS_LOG)
    add_subdirectory(log)
endif()

if(LOSCFG_COMPONENTS_NETWORK)
    add_subdirectory(net)
endif()

if(LOSCFG_COMPONENTS_OTA)
    add_subdirectory(ota)
endif()

if(LOSCFG_COMPONENTS_SECURITY)
    add_subdirectory(security)
endif()

if(LOSCFG_COMPONENTS_SENSORHUB)
    add_subdirectory(sensorhub)
endif()

if(LOSCFG_COMPONENTS_AI)
    add_subdirectory(ai)
endif()

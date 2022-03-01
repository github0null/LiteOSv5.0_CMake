
if(LOSCFG_COMPONENTS_CONNECTIVITY_MQTT)
    add_subdirectory(mqtt)
endif()

if(LOSCFG_COMPONENTS_CONNECTIVITY_LWM2M)
    add_subdirectory(lwm2m)
endif()

if(LOSCFG_COMPONENTS_CONNECTIVITY_AGENTTINY)
    add_subdirectory(agent_tiny)
endif()

if(LOSCFG_COMPONENTS_CONNECTIVITY_NB_IOT)
    add_subdirectory(nb_iot)
endif()

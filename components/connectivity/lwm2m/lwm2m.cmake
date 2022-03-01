
set(COMPONENTS_LWM2M_INCLUDE
    "${CMAKE_SOURCE_DIR}/components/connectivity/lwm2m/core"
    "${CMAKE_SOURCE_DIR}/components/connectivity/lwm2m/core/er-coap-13")

if(LOSCFG_COMPONENTS_CONNECTIVITY_LWM2M)
    list(APPEND LITEOS_CMACRO
        LWM2M_CLIENT_MODE
        LWM2M_BOOTSTRAP)
endif()

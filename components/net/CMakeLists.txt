
if(LOSCFG_COMPONENTS_NET_LWIP)
    add_subdirectory(lwip)
endif()

if(LOSCFG_COMPONENTS_NET_SAL)
    add_subdirectory(sal)
endif()

if(LOSCFG_COMPONNETS_NET_AT)
    add_subdirectory(at_device)
    add_subdirectory(at_frame)
endif()


set(COMPONENTS_NET_INCLUDE)

if(LOSCFG_COMPONENTS_NET_LWIP)
    include("${CMAKE_SOURCE_DIR}/components/net/lwip/lwip.cmake")
    list(APPEND COMPONENTS_INCLUDE ${LWIP_INCLUDE})
endif()

if(LOSCFG_COMPONENTS_NET_SAL)
    list(APPEND COMPONENTS_NET_INCLUDE "${CMAKE_SOURCE_DIR}/include/sal")
endif()

if(LOSCFG_COMPONNETS_NET_AT)
    include("${CMAKE_SOURCE_DIR}/components/net/at_device/at.cmake")
    list(APPEND COMPONENTS_INCLUDE ${COMPONENTS_AT_INCLUDE})
endif()

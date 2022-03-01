
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

set(C_SRCS)
set(LOCAL_INCS)

if(LOSCFG_COMPONENTS_NET_AT_ESP8266)
    aux_source_directory(wifi_esp8266 C_SRCS)
    list(APPEND LOCAL_INCS "${CMAKE_SOURCE_DIR}/components/net/at_device/wifi_esp8266")
endif()

if(LOSCFG_COMPONENTS_NET_AT_BG36)
    aux_source_directory(emtc_bg36 C_SRCS)
    list(APPEND LOCAL_INCS "${CMAKE_SOURCE_DIR}/components/net/at_device/emtc_bg36")
endif()

if(LOSCFG_COMPONENTS_NET_AT_SIM900A)
    aux_source_directory(gprs_sim900a C_SRCS)
    list(APPEND LOCAL_INCS "${CMAKE_SOURCE_DIR}/components/net/at_device/gprs_sim900a")
endif()

if(LOSCFG_COMPONENTS_NET_AT_BC95)
    aux_source_directory(nb_bc95 C_SRCS)
    list(APPEND LOCAL_INCS "${CMAKE_SOURCE_DIR}/components/net/at_device/nb_bc95")
endif()

list(APPEND LOCAL_INCS "${CMAKE_SOURCE_DIR}/include")

add_library(${MODULE_NAME} STATIC ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE ${LOCAL_INCS})

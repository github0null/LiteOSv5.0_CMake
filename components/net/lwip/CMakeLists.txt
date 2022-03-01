
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

set(C_SRCS)
set(LWIP_VERION lwip-2.1.2)

aux_source_directory(${LWIP_VERION}/src/api C_SRCS)
aux_source_directory(${LWIP_VERION}/src/apps/mqtt C_SRCS)
aux_source_directory(${LWIP_VERION}/src/apps/sntp C_SRCS)
aux_source_directory(${LWIP_VERION}/src/apps/mdns C_SRCS)
aux_source_directory(${LWIP_VERION}/src/apps/netbiosns C_SRCS)
aux_source_directory(${LWIP_VERION}/src/core C_SRCS)
aux_source_directory(${LWIP_VERION}/src/core/ipv4 C_SRCS)
aux_source_directory(${LWIP_VERION}/src/core/ipv6 C_SRCS)
aux_source_directory(${LWIP_VERION}/src/netif C_SRCS)
aux_source_directory(${LWIP_VERION}/src/netif/ppp C_SRCS)
aux_source_directory(${LWIP_VERION}/src/netif/ppp/polarssl C_SRCS)
aux_source_directory(lwip_port/OS C_SRCS)

add_library(${MODULE_NAME} STATIC ${C_SRCS})

target_compile_options(${MODULE_NAME} PRIVATE "-Wno-maybe-uninitialized")

#target_include_directories(${MODULE_NAME} PRIVATE "")

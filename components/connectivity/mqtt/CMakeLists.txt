
get_filename_component(${MOUDLE_NAME} ${CMAKE_CURRENT_LIST_DIR} NAME)

unset(C_SRCS)
aux_source_directory(MQTTClient-C/src C_SRCS)
aux_source_directory(MQTTClient-C/src/liteOS C_SRCS)
aux_source_directory(MQTTPacket/src C_SRCS)

add_library(${MODULE_NAME} STATIC 
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "MQTTClient-C/src"
    "MQTTClient-C/src/liteOS"
    "MQTTPacket/src"
    "${CMAKE_SOURCE_DIR}/include"
    ${LWIP_INCLUDE}
    ${COMPONENTS_SECURITY_INCLUDE})


get_filename_component(${MOUDLE_NAME} ${CMAKE_CURRENT_LIST_DIR} NAME)

unset(C_SRCS)
aux_source_directory(. C_SRCS)

add_library(${MODULE_NAME} STATIC 
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/components/components/connectivity/agent_tiny/atiny_mqtt"
    "${CMAKE_SOURCE_DIR}/components/ota/flag_operate"
    "${CMAKE_SOURCE_DIR}/include"
    ${COMPONENTS_MQTT_INCLUDE}
    ${COMPONENTS_CJSON_INCLUDE}
    ${COMPONENTS_SECURITY_INCLUDE})

target_compile_options(${MODULE_NAME} PRIVATE
    -Wno-unused-variable)

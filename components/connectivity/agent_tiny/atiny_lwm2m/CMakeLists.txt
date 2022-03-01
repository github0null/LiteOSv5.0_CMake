
get_filename_component(${MOUDLE_NAME} ${CMAKE_CURRENT_LIST_DIR} NAME)

unset(C_SRCS)
aux_source_directory(. C_SRCS)

add_library(${MODULE_NAME} STATIC 
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/components/connectivity/agent_tiny/atiny_lwm2m"
    "${CMAKE_SOURCE_DIR}/components/ota/flag_operate"
    "${CMAKE_SOURCE_DIR}/include"
    ${COMPONENTS_LWM2M_INCLUDE}
    ${COMPONENTS_SECURITY_INCLUDE})

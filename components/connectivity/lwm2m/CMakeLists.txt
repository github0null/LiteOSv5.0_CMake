
get_filename_component(${MOUDLE_NAME} ${CMAKE_CURRENT_LIST_DIR} NAME)

unset(C_SRCS)
aux_source_directory(core C_SRCS)
aux_source_directory(core/er-coap-13 C_SRCS)
aux_source_directory(examples/shared C_SRCS)

add_library(${MODULE_NAME} STATIC 
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/include"
    "${CMAKE_SOURCE_DIR}/components/connectivity/agent_tiny/atiny_lwm2m"
    "core"
    "examples/shared")

target_compile_definitions(${MODULE_NAME} PRIVATE
    LWM2M_BIG_ENDIAN)


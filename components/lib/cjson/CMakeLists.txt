
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

set(CJSON_VERSION cJSON-1.7.14)

set(C_SRCS "${CJSON_VERSION}/cJSON.c")

add_library(${MODULE_NAME} STATIC ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE "${CJSON_VERSION}")

target_compile_definitions(${MODULE_NAME} PRIVATE "_STDBOOL_H")


get_filename_component(MODULE_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

set(C_SRCS
    src/sensor_manager/sensor_commu.c 
    src/sensor_manager/sensor_manager.c)

add_library(${MODULE_NAME} STATIC
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/components/sensorhub/include/app"
    "${CMAKE_SOURCE_DIR}/components/sensorhub/include/arch"
    "${CMAKE_SOURCE_DIR}/components/sensorhub/include/common")

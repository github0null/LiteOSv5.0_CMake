
get_filename_component(${MOUDLE_NAME} ${CMAKE_CURRENT_LIST_DIR} NAME)

unset(C_SRCS)
aux_source_directory(. C_SRCS)

add_library(${MOUDLE_NAME} STATIC 
    ${C_SRCS})

target_include_directories(${MOUDLE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/components/net/at_device/nb_bc95"
    "${CMAKE_SOURCE_DIR}/include")

set(MODULE_NAME "kernel")

add_subdirectory(base)
#add_subdirectory(extended)
#add_subdirectory(init)

add_library(${MODULE_NAME} OBJECT)

target_link_libraries(${MODULE_NAME} base)

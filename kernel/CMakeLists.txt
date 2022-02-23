set(MODULE_NAME "kernel")

add_subdirectory(base)
add_subdirectory(extended)
add_subdirectory(init)

add_library(${MODULE_NAME} OBJECT 
    $<TARGET_OBJECTS:base>
    $<TARGET_OBJECTS:extended>
    $<TARGET_OBJECTS:init>)

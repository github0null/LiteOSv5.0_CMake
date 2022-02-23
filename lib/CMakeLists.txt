set(MODULE_NAME "lib")

add_subdirectory(huawei_libc)
add_subdirectory(libc)
add_subdirectory(libsec)
add_subdirectory(zlib)

add_library(${MODULE_NAME} OBJECT 
    $<TARGET_OBJECTS:posix>
    $<TARGET_OBJECTS:c>
    $<TARGET_OBJECTS:sec>
    $<TARGET_OBJECTS:z>)

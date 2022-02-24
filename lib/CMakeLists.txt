if(LOSCFG_LIB_LIBC)
    add_subdirectory(huawei_libc)
    add_subdirectory(libc)
endif()

add_subdirectory(libsec)

if(LOSCFG_LIB_ZLIB)
    add_subdirectory(zlib)
endif()

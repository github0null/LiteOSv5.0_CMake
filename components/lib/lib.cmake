
set(COMPONENTS_LIB_INCLUDE)

if(LOSCFG_COMPONENTS_LIB_CJSON)
    include("${CMAKE_SOURCE_DIR}/components/lib/cjson/cjson.cmake")
    list(APPEND COMPONENTS_LIB_INCLUDE ${COMPONENTS_CJSON_INCLUDE})
endif()

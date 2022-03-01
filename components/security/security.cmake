
set(COMPONENTS_SECURITY_INCLUDE)
set(MBEDTLS_VERSION mbedtls-2.16.8)

if(LOSCFG_COMPONENTS_SECURITY_MBEDTLS)
    list(APPEND COMPONENTS_SECURITY_INCLUDE
        "${CMAKE_SOURCE_DIR}/components/security/mbedtls/mbedtls_port"
        "${CMAKE_SOURCE_DIR}/components/security/mbedtls/${MBEDTLS_VERSION}/include")
endif()

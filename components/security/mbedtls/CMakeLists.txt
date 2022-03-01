
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

set(MBEDTLS_VERSION mbedtls-2.16.8)
set(C_SRCS)

if(LOSCFG_COMPONENTS_SECURITY_MBEDTLS)
    
    aux_source_directory(mbedtls_port C_SRCS)
    aux_source_directory(${MBEDTLS_VERSION}/library C_SRCS)

    set(LOCAL_INCLUDE 
        "${CMAKE_SOURCE_DIR}/include"
        "mbedtls_port"
        "${MBEDTLS_VERSION}/include"
        "${MBEDTLS_VERSION}/include/mbedtls")

    if(LOSCFG_DTLS_PSK_ENCRYPT)
        list(APPEND C_DEFS "MBEDTLS_CONFIG_FILE=\"los_mbedtls_config_psk.h\"")
    elseif(LOSCFG_DTLS_CRET_ENCRYPT)
        list(APPEND C_DEFS "MBEDTLS_CONFIG_FILE=\"los_mbedtls_config_cert.h\"")
    else()
        list(APPEND C_DEFS "MBEDTLS_CONFIG_FILE=\"los_mbedtls_config.h\"")
    endif()

    add_library(${MODULE_NAME} STATIC 
        ${C_SRCS})

    target_include_directories(${MODULE_NAME} PRIVATE
        ${LOCAL_INCLUDE})

    target_compile_definitions(${MODULE_NAME} PRIVATE
        ${C_DEFS})

endif()


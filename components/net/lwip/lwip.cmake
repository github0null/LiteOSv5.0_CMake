set(LWIP_VERSION lwip-2.1.2)

set(LWIP_INCLUDE 
    "${CMAKE_SOURCE_DIR}/components/net/lwip/lwip_port"
    "${CMAKE_SOURCE_DIR}/components/net/lwip/lwip_port/OS"
    "${CMAKE_SOURCE_DIR}/components/net/lwip/lwip_port/arch"
    "${CMAKE_SOURCE_DIR}/components/net/lwip/ppp_port/osport"
    "${CMAKE_SOURCE_DIR}/components/net/lwip/${LWIP_VERSION}/src/include")

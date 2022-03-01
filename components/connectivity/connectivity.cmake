include(${CMAKE_SOURCE_DIR}/components/connectivity/agent_tiny/agent_tiny.cmake)
include(${CMAKE_SOURCE_DIR}/components/connectivity/mqtt/mqtt.cmake)
include(${CMAKE_SOURCE_DIR}/components/connectivity/lwm2m/lwm2m.cmake)

set(COMPONENTS_CONNECTIVITY_INCLUDE ${COMPONENTS_LWM2M_INCLUDE})

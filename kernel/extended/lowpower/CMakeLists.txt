
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

set(C_SRCS)
set(OBJ_SRCS)

if(LOSCFG_KERNEL_LOWPOWER)
    aux_source_directory(. C_SRCS)
endif()

if(LOSCFG_KERNEL_POWER_MGR)
    add_subdirectory(powermgr)
    list(APPEND OBJ_SRCS $<TARGET_OBJECTS:powermgr>)
endif()

if(LOSCFG_KERNEL_RUNSTOP)
    add_subdirectory(runstop)
    list(APPEND OBJ_SRCS $<TARGET_OBJECTS:runstop>)
endif()

if(LOSCFG_KERNEL_DEEPSLEEP OR LOSCFG_KERNEL_TICKLESS)
    add_subdirectory(tickless)
    list(APPEND OBJ_SRCS $<TARGET_OBJECTS:tickless>)
endif()

add_library(${MODULE_NAME} OBJECT
    ${C_SRCS}
    ${OBJ_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/kernel/extended/include"
    "${CMAKE_SOURCE_DIR}/kernel/extended/include/lowpower")

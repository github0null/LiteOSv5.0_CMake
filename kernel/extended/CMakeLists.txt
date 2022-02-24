
get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

set(OBJ_SRCS)

if(LOSCFG_KERNEL_CPUP)
    add_subdirectory(cpup)
    list(APPEND OBJ_SRCS $<TARGET_OBJECTS:cpup>)
endif()

if(LOSCFG_KERNEL_TRACE)
    add_subdirectory(trace)
    list(APPEND OBJ_SRCS $<TARGET_OBJECTS:trace>)
endif()

if(LOSCFG_KERNEL_LOWPOWER OR LOSCFG_KERNEL_RUNSTOP OR LOSCFG_KERNEL_TICKLESS)
    add_subdirectory(lowpower)
    list(APPEND OBJ_SRCS $<TARGET_OBJECTS:lowpower>)
endif()

if(LOSCFG_KERNEL_CPPSUPPORT)
    add_subdirectory(cppsupport)
    list(APPEND OBJ_SRCS $<TARGET_OBJECTS:cppsupport>)
endif()

add_library(${MODULE_NAME} STATIC ${OBJ_SRCS})

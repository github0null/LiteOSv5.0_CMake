
set(MODULE_NAME gui)

unset(C_SRCS)

aux_source_directory(lvgl/src/lv_core C_SRCS)
aux_source_directory(lvgl/src/lv_draw C_SRCS)
aux_source_directory(lvgl/src/lv_font C_SRCS)
aux_source_directory(lvgl/src/lv_gpu C_SRCS)
aux_source_directory(lvgl/src/lv_hal C_SRCS)
aux_source_directory(lvgl/src/lv_misc C_SRCS)
aux_source_directory(lvgl/src/lv_themes C_SRCS)
aux_source_directory(lvgl/src/lv_widgets C_SRCS)

add_library(${MODULE_NAME} STATIC
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/components/gui/lvgl/src/lv_core"
    "${CMAKE_SOURCE_DIR}/components/gui/lvgl/src/lv_draw"
    "${CMAKE_SOURCE_DIR}/components/gui/lvgl/src/lv_font"
    "${CMAKE_SOURCE_DIR}/components/gui/lvgl/src/lv_gpu"
    "${CMAKE_SOURCE_DIR}/components/gui/lvgl/src/lv_hal"
    "${CMAKE_SOURCE_DIR}/components/gui/lvgl/src/lv_misc"
    "${CMAKE_SOURCE_DIR}/components/gui/lvgl/src/lv_themes"
    "${CMAKE_SOURCE_DIR}/components/gui/lvgl/src/lv_widgets")

target_compile_definitions(${MODULE_NAME} PRIVATE
    LV_CONF_INCLUDE_SIMPLE)

if(LOSCFG_PLATFORM_STM32F769IDISCOVERY)
    target_compile_definitions(${MODULE_NAME} PRIVATE STM32F7)
    target_include_directories(${MODULE_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/targets/bsp/drivers/STM32F7xx_HAL_Driver/Inc")
endif()

target_compile_options(${MODULE_NAME} PRIVATE "-Wno-unused-value")

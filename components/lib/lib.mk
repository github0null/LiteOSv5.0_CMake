COMPONENTS_LIB_INCLUDE :=

ifeq ($(LOSCFG_COMPONENTS_LIB_CJSON), y)
include $(LITEOSTOPDIR)/components/lib/cjson/cjson.mk
COMPONENTS_LIB_INCLUDE += $(COMPONENTS_CJSON_INCLUDE)
endif
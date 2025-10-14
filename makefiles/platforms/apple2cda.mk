EXECUTABLE = $(R2R_PD)/$(PRODUCT_BASE).2gs
LIBRARY = $(R2R_PD)/$(PRODUCT_BASE).$(PLATFORM).lib

MWD := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))..)
include $(MWD)/common.mk
include $(MWD)/toolchains/vbcc.mk

$(PLATFORM_UC)_FLAGS = +iigs
CFLAGS += $($(PLATFORM_UC)_FLAGS)
LDFLAGS += $($(PLATFORM_UC)_FLAGS)

r2r:: $(BUILD_EXEC) $(BUILD_LIB) $(R2R_EXTRA_DEPS_$(PLATFORM_UC))
	make -f $(PLATFORM_MK) $(PLATFORM)/r2r-post

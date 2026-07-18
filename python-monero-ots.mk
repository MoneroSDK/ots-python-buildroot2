################################################################################
#
# python-monero-ots
#
################################################################################

PYTHON_MONERO_OTS_VERSION = 0.5.7
PYTHON_MONERO_OTS_SITE = $(call github,MoneroSDK,ots-python,v$(PYTHON_MONERO_OTS_VERSION))
PYTHON_MONERO_OTS_DEPENDENCIES = monero-ots host-python-cffi
PYTHON_MONERO_OTS_SETUP_TYPE = setuptools
PYTHON_MONERO_OTS_LICENSE = BipCot

PYTHON_MONERO_OTS_ENV = OTS_INCLUDE_PATH=$(TARGET_DIR)/usr/include
PYTHON_MONERO_OTS_ENV += OTS_LIBRARY_PATH=$(TARGET_DIR)/usr/lib


# Dirty quick fix to get the libmonero-ots.so into the build dir.
define PYTHON_MONERO_OTS_PRE_CONFIGURE
	monero_ots_build_dir = $(strip $(shell find $(BUILD_DIR) -maxdepth 1 -type d -name 'monero-ots-*' | head -n 1))

	ifeq ($(monero_ots_build_dir),)
	$(error Could not find monero-ots build dir under $(BUILD_DIR))
	endif
	$(INSTALL) -d $(@D)/include $(@D)/lib
	# $(INSTALL) -m 0644 $(monero_ots_build_dir)/ots/include/ots*.h $(@D)/include/ 2>/dev/null || true
	cp -L $(monero_ots_build_dir)/ots/libmonero-ots.so* $(@D)/ 2>/dev/null || true
endef

$(eval $(python-package))

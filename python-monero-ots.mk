################################################################################
#
# python-monero-ots
#
################################################################################

PYTHON_MONERO_OTS_VERSION = 0.4.10
PYTHON_MONERO_OTS_SITE = $(call github,MoneroSDK,ots-python,v$(PYTHON_MONERO_OTS_VERSION))
PYTHON_MONERO_OTS_DEPENDENCIES = monero-ots host-python-cffi
PYTHON_MONERO_OTS_SETUP_TYPE = setuptools
PYTHON_MONERO_OTS_LICENSE = BipCot

PYTHON_MONERO_OTS_ENV = OTS_INCLUDE_PATH=$(TARGET_DIR)/usr/include

$(eval $(python-package))

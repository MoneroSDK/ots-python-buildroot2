################################################################################
#
# python-monero-ots
#
################################################################################

PYTHON_MONERO_OTS_VERSION = 0.4.8
PYTHON_MONERO_OTS_SITE = $(call github,MoneroSDK,ots-python,v$(PYTHON_MONERO_OTS_VERSION))
PYTHON_MONERO_OTS_DEPENDENCIES = monero-ots python-cffi
PYTHON_MONERO_OTS_SETUP_TYPE = setuptools
PYTHON_MONERO_OTS_LICENSE = BipCot

$(eval $(python-package))

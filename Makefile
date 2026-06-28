VERSION := $(shell grep 'PYTHON_MONERO_OTS_VERSION '  python-monero-ots.mk | awk -F' = ' '{print $$2}')
TAG := v$(VERSION)
TAR := $(TAG).tar.gz
TARGET := python-monero-ots-$(TAR)
HASH_FILE := python-monero-ots.hash
DL_URL := https://github.com/MoneroSDK/ots-python/archive/refs/tags/$(TAR)

default: hash

$(TAR):
	@wget -L -o $(TAR) "$(DL_URL)"

$(HASH_FILE): $(TAR)
	@echo -n 'sha256  ' > $(HASH_FILE)
	@sha256sum $(TAR) >> $(HASH_FILE)
	@sed -e 's/$(TAR)/$(TARGET)/' $(HASH_FILE) > $(HASH_FILE)~
	@mv $(HASH_FILE)~ $(HASH_FILE)
	@awk '{ print $$2 }' $(HASH_FILE)

.PHONY: hash
hash: clean-hash $(HASH_FILE)

.PHONY: clean
clean: clean-tar

.PHONY: clean-tar
clean-tar:
	rm -rf $(TAR) $(TAR)~

.PHONY: clean-hash
clean-hash:
	rm $(HASH_FILE)

.PHONY: clean-all
clean-all: clean clean-hash

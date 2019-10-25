#
# makefile for kernel loadable module
#

INSTALL_HEADERS := rtk_btusb.h

#---
CROSS_COMPILE ?= arm-linux-gnueabihf-
ARCH ?= arm
V ?= 0

MKDIR   ?= mkdir
INSTALL ?= install

KERNEL_DIR ?= $(MAKETOP)/usr/src/linux
MFLAGS := ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL_DIR) M=$(CURDIR) V=$(V)
MFLAGS += INSTALL_MOD_PATH=$(MAKETOP)

INSTALL_HEADER1_DIR := $(MAKETOP)/usr/include/asm
INSTALL_HEADER2_DIR := $(KERNEL_DIR)/arch/$(ARCH)/include/generated/uapi/asm

all: modules
install: modules_install headers_install
modules_install: modules

modules modules_install clean:
	$(MAKE) $(MFLAGS) $@

distclean: clean

headers_install:
	if [ x"$(INSTALL_HEADERS)" != x"" ]; then \
		$(INSTALL) -m 0755 -d $(INSTALL_HEADER1_DIR); \
		$(INSTALL) -m 644 $(INSTALL_HEADERS) $(INSTALL_HEADER1_DIR); \
		$(INSTALL) -m 0755 -d $(INSTALL_HEADER2_DIR); \
		$(INSTALL) -m 644 $(INSTALL_HEADERS) $(INSTALL_HEADER2_DIR); \
	fi

.PHONY: all install modules modules_install headers_install clean distclean

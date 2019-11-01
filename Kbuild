CONFIG_BT_RTKBTUSB ?= m
CONFIG_BT_RTKBTUSB_DEBUG ?=

ccflags-$(CONFIG_BT_RTKBTUSB_DEBUG) += -O1 -g -DDEBUG

rtk_btusb_core-objs := rtk_btusb.o
obj-$(CONFIG_BT_RTKBTUSB) := rtk_btusb_core.o

clean-files := Module.symvers modules.order *.ko *.mod.c *.o .*.cmd
clean-dirs  := .tmp_versions

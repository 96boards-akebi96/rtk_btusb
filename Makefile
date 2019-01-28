# Realtek USB Bluetooth controller driver from Poplar board kernel

# Please override KBUILD with base kernel (build) directory
KBUILD=/lib/modules/$(shell uname -r)/build

obj-m += rtk_btusb.o

all: rtk_btusb.c rtk_btusb.h
	make -C $(KBUILD) M=$(PWD) modules

clean:
	make -C $(KBUILD) M=$(PWD) clean

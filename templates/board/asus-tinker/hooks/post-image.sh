#!/bin/bash
echo "board template post-image.sh"

MKIMAGE=$HOST_DIR/bin/mkimage

cp configs/board/output/* ../output/

wget -q -O - https://github.com/iotfap/oem-bsp-repo/raw/master/asus-tinker/uboot.bin-2.0.5.gz | gunzip > output/images/uboot.bin
wget -q -O - https://github.com/iotfap/oem-bsp-repo/raw/master/asus-tinker/zImage-2.0.5 > output/images/sys.k
wget -q -O - https://github.com/iotfap/oem-bsp-repo/raw/master/asus-tinker/rk3288-miniarm-2.0.5.dtb > output/images/sys.dtb
wget -q -O - https://github.com/iotfap/oem-bsp-repo/raw/master/asus-tinker/overlays-2.0.5.tgz | tar -xz -C output/images/

sudo cp output/images/sys.dtb output/recoveryfs/
sudo cp output/images/sys.k output/recoveryfs/
sudo cp -r output/images/overlays output/recoveryfs/
sudo cp output/images/hw_intf.conf output/recoveryfs/

sudo install -m 0644 -D configs/board/config/boot.conf output/recoveryfs/extlinux/extlinux.conf

cp output/images/sys.k ../output/sys.k
cp output/images/sys.dtb ../output/sys.dtb



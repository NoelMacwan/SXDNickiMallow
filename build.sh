 #
 # Copyright � 2014, Varun Chitre "varun.chitre15" <varun.chitre15@gmail.com>
 #
 # Custom build script
 #
 # This software is licensed under the terms of the GNU General Public
 # License version 2, as published by the Free Software Foundation, and
 # may be copied, distributed, and modified under those terms.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 #
#!/bin/bash
# export CROSS_COMPILE="/root/toolchains/arm-eabi-linaro-4.6.2/bin/arm-eabi-"
# export CROSS_COMPILE="/root/cm11/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin/arm-eabi-"
export CROSS_COMPILE="/home/noelmacwan/kernel/linaro-4.9/bin/arm-eabi-"
STRIP="/home/noelmacwan/kernel/linaro-4.9/bin/arm-eabi-strip"
MODULES_DIR="/home/noelmacwan/kernel/mm/modules"
KERNEL_DIR="/home/noelmacwan/kernel/mm"
BUILD_START=$(date +"%s")
export ARCH=arm
export SUBARCH=arm
echo "Copying modules"
rm $MODULES_DIR/*
find . -name '*.ko' -exec cp {} $MODULES_DIR/ \;
cd $MODULES_DIR
echo "Stripping modules for size"
$STRIP --strip-unneeded *.ko
zip -9 modules *
cd $KERNEL_DIR

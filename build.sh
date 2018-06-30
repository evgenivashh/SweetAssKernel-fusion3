#!/bin/bash

rm ./arch/arm/boot/zImage*

export CROSS_COMPILE=~/gcc-linaro-6.4.1/bin/arm-eabi-
make clean
make mrproper
export ARCH=arm
make fusion3_dogo_defconfig
make zImage
mv ./arch/arm/boot/zImage ./anykernel/zImage.dogo

make clean
make mrproper
export ARCH=arm
make fusion3_odin_defconfig
make zImage
mv ./arch/arm/boot/zImage ./anykernel/zImage.odin

make clean
make mrproper
export ARCH=arm
make fusion3_yuga_defconfig
make zImage
mv ./arch/arm/boot/zImage ./anykernel/zImage.yuga

cd ./anykernel

zip -r SweetAss-Kernel-v2.0-fusion3.zip . -x ".*"

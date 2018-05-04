#!/bin/bash

rm ./arch/arm/boot/zImage*

export CROSS_COMPILE=~/gcc-linaro-6.3.1/bin/arm-eabi-
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
cp ./arch/arm/boot/dtb* ./anykernel/

make clean
make mrproper
export ARCH=arm
make fusion3_yuga_defconfig
make zImage
mv ./arch/arm/boot/zImage ./anykernel/zImage.yuga
cp ./arch/arm/boot/dtb* ./anykernel/

cd ./anykernel

zip -r SmartAss-Kernel-v1.0-fusion3.zip . -x ".*"

#!/bin/bash

qemu-system-x86_64 -m 16384 --enable-kvm \
-drive file=diy.img,if=virtio \
-cdrom ./ubuntu-22.04.3-desktop-amd64.iso \
-drive file=disk.qcow2,format=qcow2,if=none,id=disk0,cache=none \
-device virtio-blk-pci,drive=disk0,bootindex=0 \
-drive file=nvme_disk.qcow2,format=qcow2,if=none,id=nvme0 \
-device nvme,drive=nvme0,serial=foo \
-net nic,model=virtio -net tap,ifname=tap0,script=no,downscript=no


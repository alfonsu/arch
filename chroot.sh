#!/bin/bash

lsblk
echo Type Your Device
read input
sudo mount /dev/$input /mnt
sudo chroot /mnt

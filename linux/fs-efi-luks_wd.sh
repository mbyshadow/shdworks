#!/bin/bash

# some times we forget
# some times shadows may not tell what they did
# we need this

# assume prepaird disk
# 100-512MiB Efi / ef00


# never trust, but check efivars
#ls /sys/firmware/efi/efivars

sdEfi=$1
sdSys=$2

cat /dev/zero > /dev/$sdEfi
cat /dev/zero > /dev/$sdSys

mkfs.vfat -F 32 /dev/$sdEfi
cryptsetup -c aes-xts-plain64 -h sha512 -s 512 --use-random --type luks1 luksFormat /dev/$sdSys
cryptsetup open /dev/$sdSys cryptroot

mount /dev/mapper/cryptroot /mnt

mkdir /mnt/boot
mkdir /mnt/efi

mount /dev/$sdEfi /mnt/efi

pacstrap /mnt base

genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArchLinux

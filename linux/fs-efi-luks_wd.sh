#!/bin/bash

#assume prepaird disk

ls /sys/firmware/efi/efivars


grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArchLinux

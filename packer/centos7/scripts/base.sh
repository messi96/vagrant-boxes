#!/bin/bash

# Remove 5s grub timeout to speed up booting
echo "[*] Removing grub timeout"
sed -i.orig -e 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
/sbin/grub2-mkconfig -o /boot/grub2/grub.cfg


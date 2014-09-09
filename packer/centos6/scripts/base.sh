#!/bin/bash

set -e

# Update the box
echo "[*] Updating yum"
yum -y update

# Install misc packages
echo "[*] Installing misc packages"
yum -y --setopt=tsflags=nodocs install yum-plugin-versionlock yum-utils

# Remove 5s grub timeout to speed up booting
echo "[*] Removing grub timeout"
sed -i.orig -e 's/timeout=5/timeout=0/' /boot/grub/grub.conf



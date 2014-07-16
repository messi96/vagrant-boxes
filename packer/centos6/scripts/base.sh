#!/bin/bash

set -e

# Import key first so that yum doesn't complain later.
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

# Update the box
echo "[*] Updating yum"
yum -y update

# Install misc packages
echo "[*] Installing misc packages"
yum -y --setopt=tsflags=nodocs install bc byobu git htop java-1.6.0-openjdk java-1.6.0-openjdk-devel puppet unzip vim-enhanced wget yum-plugin-versionlock yum-utils

# Remove 5s grub timeout to speed up booting
echo "[*] Removing grub timeout"
sed -i.orig -e 's/timeout=5/timeout=0/' /boot/grub/grub.conf



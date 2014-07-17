#!/bin/bash

if [ ! -e /root/.vbox_version ] ; then
    exit 0
fi

# VirtualBox Additions

yum -y install --setopt=tsflags=nodocs gcc make kernel-devel perl

# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /root/.vbox_version)
VBOX_ISO=/root/VBoxGuestAdditions_${VBOX_VERSION}.iso
cd /tmp

mount -o loop $VBOX_ISO /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

rm $VBOX_ISO

chkconfig vboxadd-x11 off

# Don't upgrade the kernel files after this point.
# VirtualBox Guest Additions will break if it is upgraded.
yum versionlock kernel kernel-devel kernel-doc kernel-firmware kernel-headers

yum -y remove gcc kernel-devel

#!/bin/bash

# If the kernel has been upgraded, remove old versions.
package-cleanup -y --oldkernel --count=1

yum -y remove cloog-ppl cpp glibc-devel glibc-headers kernel-headers mpfr ppl

# Clean up
echo "[*] Cleaning up yum"
yum clean all  # Remove yum's cache files.
rpm --rebuilddb

# Removing leftover leases and persistent rules
echo "[*] Cleaning up dhcp leases"
rm /var/lib/dhclient/*

# Make sure Udev doesn't block our network
echo "[*] Cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

# Cleanup /tmp
echo "[*] Cleaning up /tmp"
rm -rf /tmp/* /tmp/.[^.]+


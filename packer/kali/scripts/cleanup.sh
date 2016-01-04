#!/bin/bash

set -o nounset
set -o errexit

# Refresh dotfiles
cp /etc/skel/.bashrc /etc/skel/.profile /root

# Clean up
echo "[*] Cleaning up apt"
apt-get -y --purge autoremove
apt-get -y clean

# Remove apt.conf as we no longer want proxy configuration
rm -f /etc/apt/apt.conf

# Removing leftover leases and persistent rules
echo "[*] Cleaning up dhcp leases"
rm -f /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "[*] Cleaning up udev rules"
rm -rf /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "[*] Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

rm -f /etc/sudoers.d/packer-vagrant

# Cleanup puppet
rm -rf /var/lib/puppet

# Remove logs
find /var/log -type f -exec rm {} \;

# Cleanup /tmp
echo "[*] Cleaning up /tmp"
rm -rf /tmp/* /tmp/.[^.]+


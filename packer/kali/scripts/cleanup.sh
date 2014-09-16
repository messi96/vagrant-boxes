#!/bin/bash

set -o nounset
set -o errexit

# Clean up
echo "[*] Cleaning up apt"
apt-get -y remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove
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

# Cleanup puppet
rm -rf /var/lib/puppet

# Cleanup /tmp
echo "[*] Cleaning up /tmp"
rm -rf /tmp/* /tmp/.[^.]+


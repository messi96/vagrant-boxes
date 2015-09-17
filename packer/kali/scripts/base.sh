#!/bin/bash

set -o nounset
set -o errexit

# Update the box
echo "[*] Updating apt"
apt-get -y update

echo "[*] Upgrading"
apt-get -y dist-upgrade

# Enable gdm autologin
if [ -e /etc/gdm3/daemon.conf ]; then
    echo "[*] Enabling gdm autlogin"
    sed -i.orig -r -e 's/^#\s+(AutomaticLogin.*)/\1/' /etc/gdm3/daemon.conf
fi

echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/packer-vagrant
chmod 600 /etc/sudoers.d/packer-vagrant

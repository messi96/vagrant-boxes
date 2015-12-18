#!/bin/bash

set -o nounset
set -o errexit

# Update the box
echo "[*] Updating apt"
apt-get -y update

echo "[*] Upgrading"
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" dist-upgrade

echo "[*] Ensuring kali defaults are installed"
apt-get -y install locales-all
apt-get -y install kali-archive-keyring kali-debtags kali-defaults kali-menu kali-root-login

# Enable gdm autologin
if [ -e /etc/gdm3/daemon.conf ]; then
    echo "[*] Enabling gdm autlogin"
    sed -i.orig -r -e 's/^#\s+(AutomaticLogin.*)/\1/' /etc/gdm3/daemon.conf
fi

echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/packer-vagrant
chmod 600 /etc/sudoers.d/packer-vagrant

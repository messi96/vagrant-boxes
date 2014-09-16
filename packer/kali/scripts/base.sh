#!/bin/bash

set -o nounset
set -o errexit

# Update the box
echo "[*] Updating apt"
apt-get -y update

echo "[*] Upgrading"
apt-get -y dist-upgrade

# Install misc packages
echo "[*] Installing misc packages"
apt-get -y install byobu curl htop puppet sudo tcpdump unzip vim

# Enable metasploit and postgresql services
echo "[*] Enabling metasploit and postgresql services"
update-rc.d postgresql enable
update-rc.d metasploit enable

# Enable gdm autologin
echo "[*] Enabling gdm autlogin"
sed -i.orig -r -e 's/^#\s+(AutomaticLogin.*)/\1/' /etc/gdm3/daemon.conf

# Refresh root dotfiles from /etc/skel
cp /etc/skel/.bash* /etc/skel/.profile /root

#!/bin/bash

set -o nounset
set -o errexit

# Update the box
echo "[*] Updating apt"
apt-get -y update

echo "[*] Upgrading"
apt-get -y dist-upgrade

# Enable gdm autologin
echo "[*] Enabling gdm autlogin"
sed -i.orig -r -e 's/^#\s+(AutomaticLogin.*)/\1/' /etc/gdm3/daemon.conf


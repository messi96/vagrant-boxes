#!/bin/bash

set -e

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

apt-key adv --keyserver hkp://keys.gnupg.net --recv-keys 7D8D0BF6 > /dev/null 2>&1

# Install puppet
if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
else
  echo "[*] Installing Puppet"
  cd /tmp
  wget -q --no-check-certificate https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
  dpkg -i puppetlabs-release-wheezy.deb
  apt-get -y update
  apt-get -y install puppet
fi
       
apt-get -y update
apt-get -y install locales-all
apt-get -y install kali-archive-keyring kali-debtags kali-defaults kali-menu kali-root-login


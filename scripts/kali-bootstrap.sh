#!/bin/bash

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

grep -q compute.internal /etc/resolv.conf
if [ $? -eq 0 ];then
  echo "Changing EC2 hostname"
  sed -i.orig -r 's/^search.*\.compute.internal/search aws.example.com/' /etc/resolv.conf
  echo kali > /etc/hostname
  echo "127.0.0.1 kali" >> /etc/hosts
  /etc/init.d/hostname.sh start
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
  apt-get -y -qq update
  apt-get -y -qq install puppet
fi
       
apt-get -y -qq update
apt-get -y -qq install locales-all
apt-get -y -qq install kali-archive-keyring kali-debtags kali-defaults kali-menu kali-root-login


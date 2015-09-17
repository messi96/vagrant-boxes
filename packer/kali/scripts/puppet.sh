#!/bin/bash

set -o nounset
set -o errexit

# Install puppet
echo "[*] Installing Puppet"
cd /tmp
wget https://apt.puppetlabs.com/puppetlabs-release-jessie.deb
dpkg -i puppetlabs-release-jessie.deb
apt-get -y update
apt-get -y install puppet


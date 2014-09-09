#!/bin/bash

set -o nounset
set -o errexit

# Set up Vagrant.
date > /etc/vagrant_box_build_time

# Install vagrant keys
echo "[*] Installing vagrant ssh keys"
mkdir -pm 700 /home/vagrant/.ssh /root/.ssh
curl -sLo /home/vagrant/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
curl -sLo /root/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys /root/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
chown -R root:root /root/.ssh

# Set up sudo
echo "[*] Configuring sudo"
( cat <<'EOP'
%vagrant ALL=NOPASSWD:ALL
EOP
) > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant


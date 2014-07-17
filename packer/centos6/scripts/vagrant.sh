#!/bin/bash

# Set up Vagrant.
date > /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant
useradd -G wheel -m -s /bin/bash vagrant
echo "vagrant" | passwd --stdin vagrant

# Install vagrant key
echo "[*] Installing vagrant ssh key"
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Set up sudo
cp /etc/sudoers /etc/sudoers.orig
sed -i '/Defaults.*requiretty/d' /etc/sudoers

( cat <<'EOP'
%vagrant ALL=NOPASSWD:ALL
EOP
) > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant


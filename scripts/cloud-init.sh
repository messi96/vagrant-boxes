#!/bin/bash

sed -i.orig '/Defaults\s*requiretty/d' /etc/sudoers

# Add Vagrant user for EC2 access
# We don't disable standard user e.g. ec2-user for RHEL

/usr/sbin/useradd -m vagrant
mkdir /home/vagrant/.ssh
curl http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key > /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
/sbin/restorecon /home/vagrant/.ssh/authorized_keys

echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/vagrant

echo "" >> /etc/ssh/sshd_config
echo "" >> /etc/ssh/sshd_config
echo "UseDNS no" >> /etc/ssh/sshd_config


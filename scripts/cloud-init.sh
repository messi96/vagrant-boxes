#!/bin/bash

sed -i '/.*requiretty/d' /etc/sudoers

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

cp /etc/rc.local /etc/rc.local.orig
cat <<EOF > /etc/rc.local
#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

touch /var/lock/subsys/local
if [ ! -d /root/.ssh ] ; then
    mkdir -p /root/.ssh
    chmod 0700 /root/.ssh
    restorecon /root/.ssh
fi

# bz 707364
if [ ! -f /etc/blkid/blkid.tab ] ; then
        blkid /dev/xvda &>/dev/null
fi

EOF

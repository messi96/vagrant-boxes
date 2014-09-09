#!/bin/bash
# VMware tools
#
# http://docs.kali.org/general-use/install-vmware-tools-kali-guest
# https://github.com/offensive-security/kali-vmware-tools-patches

set -o nounset
set -o errexit

TOOLS_ISO=/root/vmware-tools.iso

echo "[*] Installing VMware tools"

apt-get -y install fuse fuse-utils linux-headers-$(uname -r)
sed -i '/cups\ disabled/d' /usr/sbin/update-rc.d 
echo cups enabled >> /usr/sbin/update-rc.d 
echo vmware-tools-thinprint enabled >> /usr/sbin/update-rc.d

git clone https://github.com/offensive-security/vmware-tools-patches /root/vmware-tools-patches

mkdir /root/vmware-tools
mount -o loop $TOOLS_ISO /root/vmware-tools
cp /root/vmware-tools/VMwareTools*.tar.gz /root/vmware-tools-patches

cd /root/vmware-tools-patches
export VMWARE_TOOLS_PATCHES_DEBUG=1
./untar-all-and-patch.sh
cd vmware-tools-distrib
sed -i "s/'RUN_CONFIGURATOR', 'yesno', 'yes');/, 'RUN_CONFIGURATOR', 'yesno', 'no');/" vmware-install.pl 
./vmware-install.pl -d
cd ..
# vmware-tools patch taken from http://blog.spiderlabs.com/2013/09/installing-vmware-tools-on-kali-linux-and-some-debugging-basics.html (thanks guys!)
patch -p0 < patches/vmware-tools.patch 
vmware-config-tools.pl -d

# cleanup
cd /root
umount /root/vmware-tools
rm -rf $TOOLS_ISO /root/vmware-tools /root/vmware-tools-patches

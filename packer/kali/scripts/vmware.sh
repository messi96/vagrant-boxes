#!/bin/bash
# VMware tools
#
# http://docs.kali.org/general-use/install-vmware-tools-kali-guest

set -o nounset
set -o errexit

echo "[*] Installing VMware tools"

apt-get -y install open-vm-toolbox

mkdir -p /mnt/hgfs

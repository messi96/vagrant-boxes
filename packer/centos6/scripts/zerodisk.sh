#!/bin/bash

# Zero out the free space to save space in the final image:
echo "[*] Zeroing free space"

swapuuid=`blkid -o value -l -s UUID -t TYPE=swap`
swappart=`readlink -f /dev/disk/by-uuid/$swapuuid`

swapoff $swappart
dd if=/dev/zero of=$swappart bs=1M
mkswap -U $swapuuid $swappart

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

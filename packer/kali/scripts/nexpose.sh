#!/bin/bash

DOWNLOAD_URL="http://download2.rapid7.com/download/NeXpose-v4/NeXposeSetup-Linux64.bin"

cd /tmp

echo "[*] Downloading Nexpose"
curl -s -o NeXposeSetup-Linux64.bin ${DOWNLOAD_URL}
curl -s -o NeXposeSetup-Linux64.bin.md5sum ${DOWNLOAD_URL}.md5sum

echo "[*] Verifying md5 checksum"
md5sum -c NeXposeSetup-Linux64.bin.md5sum

if [[ $? -ne 0 ]]; then
    echo "[*] md5 checksum verification failed"
    exit 1
fi

chmod +x NeXposeSetup-Linux64.bin

echo "[*] Running installer"
./NeXposeSetup-Linux64.bin -q -overwrite \
-Vfirstname='waratek' \
-Vlastname='waratek' \
-Vcompany='waratek' \
-Vusername='waratek' \
-Vpassword1='waratek' \
-Vpassword2='waratek' \
-Vsys.component.typical\$Boolean=true \
-Vsys.component.engine\$Boolean=false \
-VinitService\$Boolean=true \
-VdbPort=5433 \
-Vport=5433 \
-Dinstall4j.suppressUnattendedReboot=true

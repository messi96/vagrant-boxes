#!/bin/bash

set -o nounset
set -o errexit

apt-key adv --keyserver hkp://keys.gnupg.net --recv-keys 7D8D0BF6

echo "[*] Updating apt sources.list"

cat <<EOF > /etc/apt/sources.list
# deb http://http.kali.org/kali sana main

deb http://http.kali.org/kali sana main non-free contrib
deb-src http://http.kali.org/kali sana main non-free contrib

## Security updates
deb http://security.kali.org/kali-security sana/updates main contrib non-free
deb-src http://security.kali.org/kali-security sana/updates main contrib non-free
EOF


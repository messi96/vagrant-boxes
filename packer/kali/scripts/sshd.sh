#!/bin/bash

set -o nounset
set -o errexit

# Tweak sshd to prevent DNS resolution (speed up logins)
echo "[*] Tweaking sshd config"
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
echo 'UseDNS no' >> /etc/ssh/sshd_config


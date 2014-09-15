#!/bin/bash

set -e

# Update the box
echo "[*] Updating yum"
yum -y update

# Install misc packages
echo "[*] Installing misc packages"
yum -y --setopt=tsflags=nodocs install yum-plugin-versionlock yum-utils


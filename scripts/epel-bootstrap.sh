#!/usr/bin/env bash
# This bootstraps EPEL on CentOS 6.x

set -e

RPM_URL="https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if [ -r /etc/yum.repos.d/epel.repo ]; then
  echo "EPEL is already installed."
  exit 0
fi

# Install EPEL repo
echo "Installing EPEL rpm..."
rpm -i $RPM_URL

echo "EPEL repo installed!"

#!/usr/bin/env bash
# This bootstraps Puppet on CentOS 6.x
# It has been tested on CentOS 6.4 64bit
#
# Source: https://github.com/hashicorp/puppet-bootstrap

set -e

REPO_URL="http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

# Install puppet labs repo
echo "Configuring EPEL repo..."
repo_path=$(mktemp)
wget --output-document="${repo_path}" "${REPO_URL}" 2>/dev/null
rpm -i "${repo_path}" >/dev/null

echo "Importing EPEL GPG key..."
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

# Install Puppet...
echo "Installing puppet"
yum install -y puppet > /dev/null

echo "Puppet installed!"

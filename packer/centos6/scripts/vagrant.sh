#!/bin/bash


# Set up sudo
sed -i.orig '/Defaults\s*requiretty/d' /etc/sudoers


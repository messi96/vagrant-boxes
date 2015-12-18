#!/bin/bash

set -o nounset
set -o errexit

# Remove ssh keys
find /home -name "authorized_keys" -exec rm -f {} \;


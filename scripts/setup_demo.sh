#!/bin/bash

set -o nounset
set -o errexit

PUPPET_DIR="../puppet"
PUPPET_MANIFESTS_DIR="${PUPPET_DIR}/manifests"
PUPPET_MODULES_DIR="${PUPPET_DIR}/modules"

cat << EOF

__        ___    ____      _  _____ _____ _  __
\ \      / / \  |  _ \    / \|_   _| ____| |/ /
 \ \ /\ / / _ \ | |_) |  / _ \ | | |  _| | ' / 
  \ V  V / ___ \|  _ <  / ___ \| | | |___| . \ 
   \_/\_/_/   \_\_| \_\/_/   \_\_| |_____|_|\_\\
                                               

This script will use puppet to setup a Waratek Demo environment on this machine.

Prior to proceeding, please review the following requirements:

- this script should be run as the root user
- puppet 3.x should be installed
- hiera data files are modified if necessary (refer to README or other documentation)

Press <enter> to proceed

EOF

read 

if [ "$( id -u )" -ne 0 ] ; then
    echo "Please run this script as the root user"
    exit 1
fi

echo $#

if [[ $# -ne 1 ]]; then
	echo "[*] Invalid parameters"
else
	ROLE=$1
fi

case $ROLE in
	security_demo_centos)
		echo "[*] Setting up security demo"
		;;
	*)
		exit 1
		;;
esac

export FACTER_role=$ROLE

echo "[*] Running puppet..."
puppet apply --modulepath $PUPPET_MODULES_DIR --hiera_config=${PUPPET_DIR}/hiera.yaml \
--manifestdir $PUPPET_MANIFESTS_DIR --detailed-exitcodes ${PUPPET_MANIFESTS_DIR}/site.pp


#!/bin/bash

set -o nounset
set -o errexit

PUPPET_DIR="../puppet"
PUPPET_MANIFESTS_DIR="${PUPPET_DIR}/manifests"
PUPPET_MODULES_DIR="${PUPPET_DIR}/modules"

if [ "$( id -u )" -ne 0 ] ; then
    echo "Please run this script as the root user"
    exit 1
fi


function intro_message {

clear
cat << EOF

__        ___    ____      _  _____ _____ _  __
\ \      / / \  |  _ \    / \|_   _| ____| |/ /
 \ \ /\ / / _ \ | |_) |  / _ \ | | |  _| | ' / 
  \ V  V / ___ \|  _ <  / ___ \| | | |___| . \ 
   \_/\_/_/   \_\_| \_\/_/   \_\_| |_____|_|\_\\
                                               

This script will use puppet to setup a Waratek Demo environment on this machine.

Prior to proceeding, please review the following requirements:

- puppet 3.x should be installed
- hiera data files are modified if necessary (refer to README or other documentation)

Select an option:

    [1] - Setup Security Demo
    [9] - exit

EOF

}

while (true)
do
    intro_message

    read -n 1 -s CHOICE

    case $CHOICE in
        1)  echo "[*] Setting up security demo"
            ROLE="security_demo_centos"
            break
            ;;
        9)  exit 0
            ;;
        *)  echo ""
            echo "INVALID OPTION"
            sleep 1
            ;;
    esac

done

export FACTER_role=$ROLE

echo "[*] Running puppet..."
puppet apply --modulepath $PUPPET_MODULES_DIR --hiera_config=${PUPPET_DIR}/hiera.yaml \
--manifestdir $PUPPET_MANIFESTS_DIR --detailed-exitcodes ${PUPPET_MANIFESTS_DIR}/site.pp


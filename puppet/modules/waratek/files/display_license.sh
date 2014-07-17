#!/bin/bash

LICENSE_FILE="/vagrant/LICENSE.txt"
ACCEPT_FILE="$HOME/.waratek/LICENSE_ACCEPTED"

trap '' 2

function accept_license {
    echo ""
    echo "License accepted."
    echo ""

    mkdir -p $HOME/.waratek
    touch $ACCEPT_FILE
}

function refuse_license {
    echo ""
    echo "License refused."
    echo ""

    sudo -n id > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        sudo /sbin/shutdown -h now
    else
        kill -9 $PPID
    fi

    exit 1
}

if [ -r "$ACCEPT_FILE" ]
then
    exit 0
fi

cat <<EOM

This virtual machine contains an evaluation copy of Waratek's
CloudVM for Java software.

In order to proceed, please confirm acceptance of the following
license agreement:

press <ENTER> to proceed...
---------------------------------------------------------------------
EOM

read
more $LICENSE_FILE

cat <<EOM2
---------------------------------------------------------------------

Please confirm acceptance of the license agreement.
If you do not accept, this virtual machine will be shutdown

EOM2

while true; do
    read -p "Accept license agreement? (yes/no) " yn
    case $yn in
        [Yy]* ) accept_license; break;;
        [Nn]* ) refuse_license; exit 1;;
        * ) echo "Please answer yes or no.";;
    esac
done

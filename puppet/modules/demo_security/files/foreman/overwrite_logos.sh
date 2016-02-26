#!/bin/bash

if [[ ! -f /tmp/login_logo.png ]] || [[ ! -f /tmp/header_logo.png ]] || [[ ! -f /tmp/favicon.ico ]];
then
    exit 1
else
    cp -f /tmp/login_logo.png /usr/share/foreman/public/assets/login_logo.png;
    cp -f /tmp/header_logo.png /usr/share/foreman/public/assets/header_logo.png;
    cp -f /tmp/favicon.ico /usr/share/foreman/public/assets/favicon.ico;
    # Overwrite image files with unknown hashes in filename
    cp -f /tmp/login_logo.png /usr/share/foreman/public/assets/login_logo-*.png;
    cp -f /tmp/header_logo.png /usr/share/foreman/public/assets/header_logo-*.png;
    cp -f /tmp/favicon.ico /usr/share/foreman/public/assets/favicon-*.ico;
fi

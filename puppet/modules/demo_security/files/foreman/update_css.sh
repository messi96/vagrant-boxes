#!/bin/bash

sed -e 's/005C7E/990000/Ig' -e 's/0072a0/990000/Ig' -e 's/0187b6/b30000/Ig' -e 's/005b7e/990000/Ig' -e 's/006289/b30000/Ig' -i /usr/share/foreman/public/assets/application.css
sed -e 's/005C7E/990000/Ig' -e 's/0072a0/990000/Ig' -e 's/0187b6/b30000/Ig' -e 's/005b7e/990000/Ig' -e 's/006289/b30000/Ig' -i /usr/share/foreman/public/assets/application-*.css

cd /usr/share/foreman/public/assets/ || exit 1
gzip -c application-*.css > application-*.css.gz
gzip -c application.css > application.css.gz

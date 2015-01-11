#!/bin/bash

cp jvc.rules /var/lib/javad/jvm-1/tomcat7

echo "[*] Reloading Security Rules"
curl -s http://localhost:7777/jolokia/exec/com.waratek:type=tomcat7,name=VirtualContainer/loadSecurityRules | python -mjson.tool


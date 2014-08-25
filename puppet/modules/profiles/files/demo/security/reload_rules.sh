#!/bin/bash

cp rules.jaf /var/lib/javad/jvm-1/tomcat1

echo "[*] Reloading Security Rules"
curl -s http://localhost:7777/jolokia/exec/com.waratek:type=tomcat1,name=VirtualContainer/loadFirewall | python -mjson.tool


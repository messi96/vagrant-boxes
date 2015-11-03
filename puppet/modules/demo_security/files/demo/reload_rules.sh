#!/bin/bash

echo "[*] Reloading Security Rules"
curl -s http://localhost:7777/jolokia/exec/com.waratek:type=VirtualContainer,jvcName=jvc-1/loadSecurityRules| python -mjson.tool


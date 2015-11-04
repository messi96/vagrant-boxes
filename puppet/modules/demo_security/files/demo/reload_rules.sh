#!/bin/bash

echo "[*] Reloading Security Rules"
RESPONSE=`curl -s http://localhost:7777/jolokia/exec/com.waratek:type=VirtualContainer,jvcName=jvc-1/loadSecurityRules| python -mjson.tool`
STATUS=`echo "$RESPONSE" | grep status`

echo "$RESPONSE"

if [[ "$STATUS" =~ "200" ]]; then
    exit 0
else
    exit 1
fi

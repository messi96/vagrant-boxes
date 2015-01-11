#!/bin/bash

export JAVA_HOME="/usr/lib/jvm/java-waratek/jre"
export JVM_OPTS="-Xmx512M -Xdaemon -Dcom.waratek.ssh.server=on"
export JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1234 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.waratek.jmxhttp.jolokia"
export PATH=$JAVA_HOME/bin:$PATH

echo "[*] Killing existing JVMs"
jvmkill --all

echo "[*] Undefining existing JVC configuration"
jvmundefine --all

echo "[*] Cleaning up logs"
rm -f /var/log/javad/jvm-1/rules.log

echo "[*] Starting javad"
$JAVA_HOME/bin/javad $JVM_OPTS $JMX_OPTS

echo "[*] Defining empty JVC"
curl -s http://localhost:7777/jolokia/exec/com.waratek:type=VirtualMachine/defineContainer/tomcat1/dummy/!/home!/vagrant | python -mjson.tool
echo "--------------------------------------------"

cp jvc.rules /var/lib/javad/jvm-1/tomcat1

echo "[*] Starting Tomcat"
/opt/apache-tomcat/bin/startup.sh


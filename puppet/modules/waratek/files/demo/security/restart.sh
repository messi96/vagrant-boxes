#!/bin/bash

export JAVA_HOME="/usr/lib/jvm/java-waratek/jre"
export JVM_OPTS="-Xdaemon -Dcom.waratek.ssh.server=on"
export JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1234 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.waratek.jmxhttp.jolokia"
export PATH=$JAVA_HOME/bin:$PATH
export JAVA_OPTS="--jvc=jafdemo"

echo "[*] Killing existing JVMs"
jvmkill --all

echo "[*] Undefining existing JVC configuration"
jvmundefine --all

echo "[*] Starting javad"
$JAVA_HOME/bin/javad $JVM_OPTS $JMX_OPTS

echo "[*] Defining empty JVC"
curl -s http://localhost:7777/jolokia/exec/com.waratek:type=VirtualMachine/defineContainer/jafdemo/dummy/!/home!/vagrant | python -mjson.tool
echo "--------------------------------------------"

cp rules.jaf /var/lib/javad/jvm-1/jafdemo

echo "[*] Starting Tomcat"
$HOME/apache-tomcat-7.0.53/bin/startup.sh


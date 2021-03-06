#!/bin/bash

export WARATEK_HOME="/usr/lib/jvm/java-waratek/jre"
export PATH="$WARATEK_HOME:$PATH"
export JVM_OPTS="-Xmx512M -Xdaemon -Dcom.waratek.ssh.server=on"
export JMX_OPTS="-Dcom.sun.management.jmxremote \
-Dcom.sun.management.jmxremote.port=1234 \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.waratek.jmxhttp.jolokia"

echo "[*] Killing existing JVMs"
jvmkill --all

echo "[*] Undefining existing JVC configuration"
jvmundefine --all

echo "[*] Cleaning up logs"
rm -f /var/log/javad/jvm-1/rules.log

echo "[*] Starting javad"
$WARATEK_HOME/bin/javad $JVM_OPTS $JMX_OPTS

echo "[*] Defining empty JVC for Tomcat 7"
curl -s http://localhost:7777/jolokia/exec/com.waratek:type=VirtualMachine/defineContainer/tomcat7/dummy/!/home!/vagrant | python -mjson.tool
echo "--------------------------------------------"

WAIT_TIME=0
while [ ! -f /var/lib/javad/jvm-1/tomcat7/snapshot.xml ]
do
    echo "[*] Waiting for Tomcat7 JVC to come up"
    (( WAIT_TIME += 1 ))
    sleep 1

    if [ $WAIT_TIME -ge 5 ]; then
        echo "[*] Container startup failed"
        exit 1
    fi
done

echo "[*] Deploying jvc.rules file for Tomcat 7"
cp jvc.rules /var/lib/javad/jvm-1/tomcat7

echo "[*] Starting Tomcat 7 using jdk-1.6.0_43"
export JAVA_HOME="${WARATEK_HOME}/jvc/jdk-1.6.0_43"
export CATALINA_OPTS="--jvc=tomcat7 --async"
/opt/apache-tomcat/tomcat7/bin/startup.sh


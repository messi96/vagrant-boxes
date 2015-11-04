#!/bin/bash

export JAVA_HOME="/usr/lib/jvm/java-waratek/jre"
export JMX_OPTS="-Dcom.waratek.management.jmxremote \
-Dcom.waratek.management.jmxremote.port=1234 \
-Dcom.waratek.management.jmxremote.authenticate=false \
-Dcom.waratek.management.jmxremote.ssl=false \
-Dcom.waratek.jmxhttp.jolokia"

export WARATEK_OPTS="-Dcom.waratek.jvm.name=tomcat7 \
-Dcom.waratek.rules.file=$HOME/demo/jvc.rules \
-Dcom.waratek.log.properties=$HOME/demo/logProps.xml"

export CATALINA_OPTS="-Xmx512M $WARATEK_OPTS $JMX_OPTS"


#!/bin/bash

export CATALINA_HOME="/opt/apache-tomcat"
export CATALINA_BASE="<%= @base_dir %>"
export JAVA_HOME="/usr/lib/jvm/java-waratek/jre"

${CATALINA_HOME}/bin/shutdown.sh
${JAVA_HOME}/bin/jvckill --jvc=<%= @title %> > /dev/null 2>&1
${JAVA_HOME}/bin/jvcundefine --jvc=<%= @title %> > /dev/null 2>&1

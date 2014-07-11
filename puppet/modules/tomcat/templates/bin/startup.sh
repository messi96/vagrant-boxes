#!/bin/bash

export CATALINA_HOME="/opt/apache-tomcat"
export CATALINA_BASE="<%= @base_dir %>"
export JAVA_HOME="/usr/lib/jvm/java-openjdk/jre"

${CATALINA_HOME}/bin/startup.sh


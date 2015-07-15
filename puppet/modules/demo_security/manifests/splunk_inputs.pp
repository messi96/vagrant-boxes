class demo_security::splunk_inputs inherits demo_security {

  splunk::input::monitor { "waratek_rules":
    path       => "/var/log/javad/jvm-1/rules.log",
    sourcetype => "waratek_security"
  }

  splunk::input::monitor { "apache_access":
    path       => "/var/log/httpd/access_log",
    sourcetype => "access_combined"
  }

  splunk::input::monitor { "tomcat_access":
    path       => "/opt/apache-tomcat/tomcat7/logs/localhost_access_log.*",
    sourcetype => "access_common"
  }

  splunk::input::monitor { "tomcat_catalina":
    path       => "/opt/apache-tomcat/tomcat7/logs/catalina.out",
    sourcetype => "catalina"
  }

}

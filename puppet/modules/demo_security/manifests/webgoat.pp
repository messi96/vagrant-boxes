class demo_security::webgoat inherits demo_security {

  tomcat::war { 'WebGoat.war':,
    catalina_base => "$catalina_base",
    war_source    => "https://github.com/WebGoat/WebGoat/releases/download/v6.0.1/WebGoat-6.0.1.war"
  } ->

  file { "${catalina_base}/webapps/WebGoat.war":
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644'
  }

}

class demo_security::webgoat inherits demo_security {

  tomcat::war { 'WebGoat.war':,
    catalina_base => "$tomcat7_home",
    war_source    => "https://github.com/WebGoat/WebGoat/releases/download/v6.0.1/WebGoat-6.0.1.war"
  } ->

  file { "${tomcat7_home}/webapps/WebGoat.war":
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644'
  }

}

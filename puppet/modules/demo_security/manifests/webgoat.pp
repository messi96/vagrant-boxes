class demo_security::webgoat inherits demo_security {

  file { '/tmp/webgoat':
    ensure => 'directory'
  } ->

  staging::deploy { 'WebGoat-6.0.1-war-exec.jar':
    source  => 'https://webgoat.atlassian.net/builds/browse/WEB-WGM/latestSuccessful/artifact/shared/WebGoat-Embedded-Tomcat/WebGoat-6.0.1-war-exec.jar',
    target  => '/tmp/webgoat',
    creates => '/tmp/webgoat/WebGoat.war'
  } ->

  file { "${tomcat7_home}/webapps/WebGoat.war":
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644',
    source      => '/tmp/webgoat/WebGoat.war'
  }

}

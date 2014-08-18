class profiles::demo_security::tomcat {

  $catalina_base = '/home/vagrant/tomcat'
  $version       = '7.0.55'
  $source_url    = "https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-${version}.tar.gz"

  class { '::tomcat':
    user          => "$vagrantuser",
    group         => "$vagrantuser",
    manage_user   => false,
    manage_group  => false
  } ->
  
  tomcat::instance { 'tomcat-demo':
    catalina_base => "$catalina_base",
    source_url    => "$source_url"
  } ->

  # Waratek test application
  tomcat::war { 'HeisenbergTestApp.war':,
    catalina_base => "$catalina_base",
    war_source    => '/synced_folder/HeisenbergTestApp.war'
  } -> 

  # Struts blank application
  staging::deploy { 'struts-2.2.1.1-apps.zip':
    source => 'https://archive.apache.org/dist/struts/examples/struts-2.2.1.1-apps.zip',
    target => '/tmp/',
    user   => "$vagrantuser",
    group  => "$vagrantuser",
  } ->

  tomcat::war { 'struts2-blank.war':,
    catalina_base => "$catalina_base",
    war_source    => '/tmp/struts-2.2.1.1/apps/struts2-blank.war'
  } 

}

class profiles::demo_security inherits profiles::base {

  class { "waratek": }

  class { "waratek::cloudvm-rpm":
    version => "2.6.5.GA.2.JAS-104"
  }

  class { "sqlmap": }

  class { "oracle_xe":
    version => "11.2.0-1.0",
  }

  service { "oracle-xe":
    ensure    => "running",
    enable    => "true",
    hasstatus => "false",
    pattern   => "tnslsnr"
  }

  class { 'tomcat':
    user          => "$vagrantuser",
    group         => "$vagrantuser",
    manage_user   => false,
    manage_group  => false
  }
  
  tomcat::instance { 'tomcat-demo':
    catalina_base => '/home/vagrant/tomcat',
    source_url    => 'https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz'
  } ->

  tomcat::war { 'HeisenbergTestApp.war':
    catalina_base => '/home/vagrant/tomcat',
    war_source    => '/synced_folder/HeisenbergTestApp.war'
  }

}

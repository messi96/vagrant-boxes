class profiles::demo_basic inherits profiles::base {


  class { "waratek::elasticat":
    version   =>  "1.3.2-86"
  }


  file { "/home/${vagrantuser}/tomcat":
    ensure => 'directory',
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => '0755'
  }


  class { 'tomcat':
    user          => "$vagrantuser",
    group         => "$vagrantuser",
    manage_user   => false,
    manage_group  => false
  }
  
  tomcat::instance { 'tomcat1':
    catalina_base => '/home/vagrant/tomcat/tomcat1',
    source_url    => 'https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz'
  }

  tomcat::instance { 'tomcat2':
    catalina_base => '/home/vagrant/tomcat/tomcat2',
    source_url    => 'https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz'
  }

  tomcat::instance { 'tomcat3':
    catalina_base => '/home/vagrant/tomcat/tomcat3',
    source_url    => 'https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz'
  }

  tomcat::instance { 'tomcat4':
    catalina_base => '/home/vagrant/tomcat/tomcat4',
    source_url    => 'https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz'
  }

}

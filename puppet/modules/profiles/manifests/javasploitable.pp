class profiles::javasploitable inherits profiles::base {

  include '::mysql::server'
  include nyancat

  class { "elasticsearch":
    version      => "1.1.1-1",
    manage_repo  => true,
    repo_version => "1.1",
    status       => 'enabled'
  }

  class { 'tomcat': }

  tomcat::instance { 'javasploitable':
    source_url => 'https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz'
  }


  # class { "roller":
  #     version => "5.0.1"
  # }

}

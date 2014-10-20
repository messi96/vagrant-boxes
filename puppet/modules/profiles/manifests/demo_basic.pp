class profiles::demo_basic {

  $tomcat_instances = hiera('tomcat::instances', {})
  create_resources('tomcat::instance', $tomcat_instances)

  # Tomcat 1
  tomcat::config::server { 'tomcat1':
    catalina_base => '/opt/apache-tomcat/tomcat1',
    port          => '8105',
  }

  tomcat::config::server::connector { 'tomcat1-http':
    catalina_base         => '/opt/apache-tomcat/tomcat1',
    port                  => '8180',
    protocol              => 'HTTP/1.1',
    additional_attributes => {
      'redirectPort'      => '8143'
    },
  }

  tomcat::config::server::connector { 'tomcat1-ajp':
    catalina_base         => '/opt/apache-tomcat/tomcat1',
    port                  => '8009',
    protocol              => 'AJP/1.3',
    additional_attributes => {
      'redirectPort'      => '8443'
    },
    connector_ensure      => 'absent'
  }

  # Tomat 2
  tomcat::config::server { 'tomcat2':
    catalina_base => '/opt/apache-tomcat/tomcat2',
    port          => '8205',
  }

  tomcat::config::server::connector { 'tomcat2-http':
    catalina_base         => '/opt/apache-tomcat/tomcat2',
    port                  => '8280',
    protocol              => 'HTTP/1.1',
    additional_attributes => {
      'redirectPort' => '8243'
    },
  }

  tomcat::config::server::connector { 'tomcat2-ajp':
    catalina_base         => '/opt/apache-tomcat/tomcat2',
    port                  => '8009',
    protocol              => 'AJP/1.3',
    additional_attributes => {
      'redirectPort'      => '8443'
    },
    connector_ensure      => 'absent'
  }

}

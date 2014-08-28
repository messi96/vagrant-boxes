class profiles::demo_security::tomcat {

  $tomcat_instances = hiera('tomcat::instances', {})
  create_resources('tomcat::instance', $tomcat_instances)

  $tomcat_wars = hiera('tomcat::wars', {})
  create_resources('tomcat::war', $tomcat_wars)

  $catalina_base = $tomcat_instances[tomcat1][catalina_base]
  notice ($catalina_base)

  # $version       = '7.0.55'
  # $source_url    = "https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-${version}.tar.gz"

  # class { '::tomcat':
  #   user          => "$vagrantuser",
  #   group         => "$vagrantuser",
  #   manage_user   => false,
  #   manage_group  => false
  # } ->
  
  # tomcat::instance { 'tomcat-demo':
  #   catalina_base => "$catalina_base",
  #   source_url    => "$source_url"
  # } ->

  # # Waratek test application
  # tomcat::war { 'HeisenbergTestApp.war':,
  #   catalina_base => "$catalina_base",
  #   war_source    => '/synced_folder/HeisenbergTestApp.war'
  # } -> 

  # Struts blank application
  staging::deploy { 'struts-2.2.1.1-apps.zip':
    source  => 'https://archive.apache.org/dist/struts/examples/struts-2.2.1.1-apps.zip',
    target  => '/tmp/',
    creates => '/tmp/struts-2.2.1.1/LICENSE.txt',
    user    => "$vagrantuser",
    group   => "$vagrantuser"
  } ->

  tomcat::war { 'struts2-blank.war':,
    catalina_base => "$catalina_base",
    war_source    => '/tmp/struts-2.2.1.1/apps/struts2-blank.war'
  } ->

  file { "${catalina_base}/webapps/struts2-blank":
    ensure      =>  "directory",
    owner       =>  "${vagrantuser}",
    group       =>  "${vagrantuser}",
    mode        =>  0755
  } ->

  exec { "extract-struts-warfile":
    command     =>  "/usr/bin/jar -xf ${catalina_base}/webapps/struts2-blank.war",
    cwd         =>  "${catalina_base}/webapps/struts2-blank",
    creates     =>  "${catalina_base}/webapps/struts2-blank/index.html",
    user        =>  "${vagrantuser}",
    group       =>  "${vagrantuser}",
  } -> 

  file { "${catalina_base}/webapps/struts2-blank/example/HelloWorld.jsp":
    ensure      =>  "present",
    owner       =>  "${vagrantuser}",
    group       =>  "${vagrantuser}",
    mode        =>  0644,
    source      =>  "puppet:///modules/profiles/HelloWorld.jsp",
  } ->

  tomcat::setenv::entry { 'JAVA_HOME':
    value      => "/usr/lib/jvm/java-waratek/jre\n",
    base_path  => "${catalina_base}/bin",
  }

  tomcat::setenv::entry { 'CATALINA_OPTS':
    value      => "--jvc=tomcat1\n",
    base_path  => "${catalina_base}/bin",
  }

}

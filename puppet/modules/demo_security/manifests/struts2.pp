class demo_security::struts2 inherits demo_security {

  # Struts blank application
  staging::deploy { 'struts-2.2.1.1-apps.zip':
    source  => 'https://archive.apache.org/dist/struts/examples/struts-2.2.1.1-apps.zip',
    target  => '/tmp/',
    creates => '/tmp/struts-2.2.1.1/LICENSE.txt',
    user    => "$demo_user",
    group   => "$demo_group"
  } ->

  tomcat::war { 'struts2-blank.war':,
    catalina_base => "$catalina_base",
    war_source    => '/tmp/struts-2.2.1.1/apps/struts2-blank.war'
  } ->

  file { "${catalina_base}/webapps/struts2-blank":
    ensure      =>  "directory",
    owner       =>  "${demo_user}",
    group       =>  "${demo_group}",
    mode        =>  0755
  } ->

  exec { "extract-struts-warfile":
    command     =>  "/usr/bin/jar -xf ${catalina_base}/webapps/struts2-blank.war",
    cwd         =>  "${catalina_base}/webapps/struts2-blank",
    creates     =>  "${catalina_base}/webapps/struts2-blank/index.html",
    user        =>  "${demo_user}",
    group       =>  "${demo_group}",
  } -> 

  file { "${catalina_base}/webapps/struts2-blank/example/HelloWorld.jsp":
    ensure      =>  "present",
    owner       =>  "${demo_user}",
    group       =>  "${demo_group}",
    mode        =>  0644,
    source      =>  "puppet:///modules/demo_security/HelloWorld.jsp",
  }

}

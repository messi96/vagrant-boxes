# == Class: demo_security
#
# Full description of class demo_security here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { demo_security:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class demo_security::tomcat inherits demo_security {

  $catalina_base = hiera('tomcat::catalina_home')
  $version       = hiera('tomcat::version')
  $source_url    = "https://archive.apache.org/dist/tomcat/tomcat-7/v${version}/bin/apache-tomcat-${version}.tar.gz"

  class { '::tomcat':
    user         => "$demo_user",
    group        => "$demo_group",
    manage_user  => false,
    manage_group => false
  }

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

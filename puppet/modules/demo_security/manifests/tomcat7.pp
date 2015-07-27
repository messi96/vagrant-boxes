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
class demo_security::tomcat7 inherits demo_security {

  $source_url    = "https://archive.apache.org/dist/tomcat/tomcat-7/v${tomcat7_version}/bin/apache-tomcat-${tomcat7_version}.tar.gz"

  tomcat::instance { 'tomcat7':
    catalina_base => "$tomcat7_home",
    source_url    => "$source_url"
  } ->

  file { "${tomcat7_home}/conf/tomcat-users.xml":
    ensure => "file",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    mode   => 0644,
    source => "puppet:///modules/demo_security/demo/tomcat/tomcat-users.xml",
  } ->

  file { "${tomcat7_home}/bin/setenv.sh":
    ensure => "absent",
  }

}

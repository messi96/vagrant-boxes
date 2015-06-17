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
class demo_security::params {

  $demo1_ip   = '172.21.21.21'
  $demo1_ip   = '172.21.21.22'
  $kali_ip    = '172.21.21.30'
  $monitor_ip = '172.21.21.40'

  if ($demo_user == undef) and ($::vagrantuser) {
  	$demo_user  = $::vagrantuser
  	$demo_group = $::vagrantuser
  }

  $tomcat6_home     = hiera('tomcat::tomcat6_home', undef)
  $tomcat6_version  = hiera('tomcat::tomcat6_version', undef)
  $tomcat7_home     = hiera('tomcat::tomcat7_home', undef)
  $tomcat7_version  = hiera('tomcat::tomcat7_version', undef)
  $spiracle_version = hiera('spiracle::version', undef)

}

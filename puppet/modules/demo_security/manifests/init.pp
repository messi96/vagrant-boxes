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
class demo_security (
  $catalina_base  = $demo_security::params::catalina_base,
  $centos_ip      = $demo_security::params::centos_ip,
  $demo_user      = $demo_security::params::demo_user,
  $demo_group     = $demo_security::params::demo_group,
  $kali_ip        = $demo_security::params::kali_ip,
  $tomcat_version = $demo_security::params::tomcat_version
) inherits demo_security::params {


}

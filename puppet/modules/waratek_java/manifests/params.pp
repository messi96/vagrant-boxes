# == Class: waratek_java
#
# Full description of class waratek_java here.
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
#  class { waratek_java:
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
class waratek_java::params {

  case $::operatingsystem {
    'RedHat', 'CentOS': {
      $package_ensure  = undef
      $package_version = undef
      $service_enable  = false
      $service_ensure  = false
      $package_source  = "http://download.waratek.com/rpm/x86_64/java-1.6.0-waratek-${package_version}.x86_64.rpm?src=vagrant"
  }
  default: {
  	err('XXXXX')
  }

  
}

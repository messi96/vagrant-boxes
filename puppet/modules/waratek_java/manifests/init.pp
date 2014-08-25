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
class waratek_java (
  $package_ensure  = $waratek_java::params::package_ensure,
  $package_source  = $waratek_java::params::package_source,
  $service_enable  = $waratek_java::params::service_enable,
  $service_ensure  = $waratek_java::params::service_ensure,
  $version         = $waratek_java::params::version,
) inherits waratek_java::params {

  validate_bool($service_enable)
  validate_bool($service_ensure)

  if ( ( ! $package_source ) and ( ! $version ) ) {
  	fail('No version or package source specified')
  }

  if ( ! $package_source ) {
  	$real_package_source = "http://download.waratek.com/rpm/x86_64/java-1.6.0-waratek-${version}.x86_64.rpm?src=vagrant"
  } else {
  	$real_package_source = "$package_source/java-1.6.0-waratek-${version}.x86_64.rpm"
  }

  anchor { 'waratek_java::begin': } ->
  class { '::waratek_java::install': } ->
  class { '::waratek_java::libcgroup': } ->
  class { '::waratek_java::config': } ->
  #class { '::waratek_java::service': } ->
  anchor { 'waratek_java::end': }

}

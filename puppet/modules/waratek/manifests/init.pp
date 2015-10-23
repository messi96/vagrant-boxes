# == Class: waratek
#
# Full description of class waratek here.
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
#  class { waratek:
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
class waratek (
  $package_ensure  = $waratek::params::package_ensure,
  $package_name    = $waratek::params::package_name,
  $package_source  = $waratek::params::package_source,
  $service_enable  = $waratek::params::service_enable,
  $service_ensure  = $waratek::params::service_ensure,
  $version         = $waratek::params::version,
) inherits waratek::params {

  validate_bool($service_enable)
  validate_bool($service_ensure)

  if ( ( ! $package_source ) and ( ! $version ) ) {
  	fail('No version or package source specified')
  }

  if ( ! $package_source ) {
  	$real_package_source = "http://download.waratek.com/rpm/x86_64/${package_name}-${version}.x86_64.rpm?src=vagrant"
  } else {
  	$real_package_source = "$package_source/${package_name}-${version}.x86_64.rpm"
  }

  case $package_name {
    'java-1.6.0-waratek': { $alternatives_command = '/usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.6.0-waratek.x86_64/bin/java' }
    'java-1.7.0-waratek': { $alternatives_command = '/usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.7.0-waratek.x86_64/jvc/jdk-1.6.0_43/jre/bin/java' }
    default:              { fail 'Invalid package name'}
  }

  anchor { 'waratek::begin': }      ->
  class { '::waratek::libcgroup': } ->
  class { '::waratek::install': }   ->
  class { '::waratek::config': }    ->
  #class { '::waratek::service': } ->
  anchor { 'waratek::end': }

}

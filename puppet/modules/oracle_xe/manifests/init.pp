# == Class: oracle_xe
#
# Full description of class oracle_xe here.
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
#  class { oracle_xe:
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
class oracle_xe (
  $package_ensure  = $oracle_xe::params::package_ensure,
  $package_source  = $oracle_xe::params::package_source,
  $service_enable  = $oracle_xe::params::service_enable,
  $service_ensure  = $oracle_xe::params::service_ensure
) inherits oracle_xe::params {

  anchor { 'oracle_xe::begin': } ->
  class { '::oracle_xe::install': } ->
  class { '::oracle_xe::config': } ->
  class { '::oracle_xe::service': } ->
  anchor { 'oracle_xe::end': }

}

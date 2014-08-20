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
class oracle_xe::config inherits oracle_xe {

  file { '/root/xe.rsp':
    ensure   => 'present',
    source   => 'puppet:///modules/oracle_xe/xe.rsp',
    owner    => 'root',
    group    => 'root',
    mode     => '0600'
  } ->

  exec { 'oracle-xe-configure':
    command  => '/etc/init.d/oracle-xe configure responseFile=/root/xe.rsp',
    creates  => '/etc/sysconfig/oracle-xe',
  }

  file { "/etc/profile.d/oracle-xe.sh":
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/oracle_xe/etc/profile.d/oracle-xe.sh',
  }

}

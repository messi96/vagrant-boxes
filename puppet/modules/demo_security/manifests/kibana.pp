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
class demo_security::kibana inherits demo_security {

  exec { 'remove-old-kibana':
    command => '/bin/rm -rf /opt/kibana/kibana-*-linux-x64',
    onlyif  => '/bin/ls /opt/kibana/kibana-*-linux-x64'
  }

  exec { 'elasticsearch-gpg-key':
    command => '/bin/rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch',
    unless  => '/bin/rpm -q gpg-pubkey | /bin/grep -q gpg-pubkey-d88e42b4-52371eca'
  } ->

  file { '/etc/yum.repos.d/kibana.repo':
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/demo_security/kibana/kibana.repo'
  } ->

  package { 'kibana':
    ensure => 'present'
  } ->

  file { "/opt/kibana/config/kibana.yml":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/demo_security/kibana/kibana.yml',
  } ~>

  service { 'kibana':
    ensure => true,
    enable => true
  }

}

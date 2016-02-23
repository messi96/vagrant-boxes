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
class demo_security::monitor inherits demo_security {

  vcsrepo { '/opt/splunk/etc/apps/waratek':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/prateepb/splunk-test-app.git',
    user     => 'splunk',
    require  => Package['splunk'],
    notify   => Service['splunk']
  } ->

  file { '/opt/splunk/etc/apps/waratek/local/inputs.conf':
  	ensure => present,
  	source => 'puppet:///modules/demo_security/splunk/inputs.conf',
  	owner  => 'splunk',
  	group  => 'splunk',
  	mode   => '0644',
    notify   => Service['splunk']
  }

  $config_hash = {
    'JAVA_HOME' => '/usr/lib/jvm/java-1.7.0',
    'ES_JAVA_OPTS' => '-Des.network.host=0.0.0.0'
  }

  elasticsearch::instance { 'es-01':
    init_defaults => $config_hash
  }

  file { '/etc/puppet/environments/production/modules/waratek_rules':
    ensure  => 'link',
    target  => "${::vagrant_module_path}/waratek_rules",
  }

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

  service { 'kibana':
    ensure => true,
    enable => true
  }

}

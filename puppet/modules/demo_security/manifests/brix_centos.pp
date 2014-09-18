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
class demo_security::brix_centos {

  host { 'kali':
    ip           => '10.1.2.102',
    host_aliases => 'kali.brix.waratek.com'
  }

  service { 'iptables':
    ensure => false,
    enable => false
  }

  service { 'ip6tables':
    ensure => false,
    enable => false
  }

  vcsrepo { '/opt/splunk/etc/apps/waratek':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/prateepb/splunk-test-app.git',
    require  => Package['splunk'],
    notify   => Service['splunk']
  }

}
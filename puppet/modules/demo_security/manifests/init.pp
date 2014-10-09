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
class demo_security {

  file { "/home/${vagrantuser}/demo":
    ensure => "directory",
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => 0755
  }

  file { "/home/${vagrantuser}/demo/reload_rules.sh":
    ensure => "file",
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => 0755,
    source => "puppet:///modules/demo_security/reload_rules.sh",
  }

  file { "/home/${vagrantuser}/demo/restart.sh":
    ensure => "file",
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => 0755,
    source => "puppet:///modules/demo_security/restart.sh",
  }

  file { "/home/${vagrantuser}/demo/rules.jaf":
    ensure => "file",
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => 0644,
    source => "puppet:///modules/demo_security/rules.jaf",
  }

  service { 'iptables':
    ensure => false,
    enable => false
  }

  service { 'ip6tables':
    ensure => false,
    enable => false
  }

}

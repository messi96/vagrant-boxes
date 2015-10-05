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
  $demo1_ip         = $demo_security::params::demo1_ip,
  $demo2_ip         = $demo_security::params::demo2_ip,
  $demo_group       = $demo_security::params::demo_group,
  $demo_user        = $demo_security::params::demo_user,
  $kali_ip          = $demo_security::params::kali_ip,
  $kibana_version   = $demo_security::params::kibana_version,
  $monitor_ip       = $demo_security::params::monitor_ip,
  $spiracle_version = $demo_security::params::spiracle_version,
  $tomcat6_home     = $demo_security::params::tomcat6_home,
  $tomcat6_version  = $demo_security::params::tomcat6_version,
  $tomcat7_home     = $demo_security::params::tomcat7_home,
  $tomcat7_version  = $demo_security::params::tomcat7_version
) inherits demo_security::params {

  host { 'demo1':
    ip           => "$demo1_ip",
    host_aliases => "demo1.${::domain}"
  }

  host { 'demo2':
    ip           => "$demo2_ip",
    host_aliases => "demo2.${::domain}"
  }

  host { 'kali':
    ip           => "$kali_ip",
    host_aliases => "kali.${::domain}"
  }

  host { 'monitor':
    ip           => "$monitor_ip",
    host_aliases => "monitor.${::domain}"
  }

  if ($::osfamily == "RedHat") {
    service { 'iptables':
      ensure => false,
      enable => false
    }

    service { 'ip6tables':
      ensure => false,
      enable => false
    }

    exec { 'disable-selinux':
      command => '/usr/sbin/setenforce 0',
      onlyif  => '/usr/bin/test `/usr/sbin/getenforce | /bin/grep Enforcing`'
    }

    augeas { 'disable-selinux':
      context => '/files/etc/selinux/config',
      changes => [
        'set SELINUX permissive'
      ],
    }
  }

}

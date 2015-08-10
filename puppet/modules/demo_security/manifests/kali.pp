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
class demo_security::kali inherits demo_security {

  if ($::ec2_local_ipv4 =~ /\d+/) {
    host { 'kali.external':
      ip => "$::ec2_local_ipv4"
    }
  } elsif ($::ipaddress_eth1 =~ /\d+/) {
    host { 'kali.external':
      ip => "$::ipaddress_eth1"
    }
  }

  file { "/root/cve-2013-2251.rc":
    ensure => "file",
    mode   => 0644,
    owner  => "root",
    group  => "root",
    source => "puppet:///modules/demo_security/kali/cve-2013-2251.rc",
  }

  file { '/root/.bashrc':
    ensure => 'present',
    source => '/etc/skel/.bashrc',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

  file { '/root/.profile':
    ensure => 'present',
    source => '/etc/skel/.profile',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

  if ($::domain =~ /example.com/) {
    service { 'postgresql':
      enable    => true,
      ensure    => true,
      hasstatus => false,
      require   => Package["postgresql"]
    } ->

    service { 'metasploit':
      enable  => true,
      ensure  => true,
      require => Package["metasploit"]
    }
  } else {
    service { 'postgresql':
      enable  => true,
      require => Package["postgresql"]
    }

    service { 'metasploit':
      enable  => true,
      require => Package["metasploit"]
    }
  }
}

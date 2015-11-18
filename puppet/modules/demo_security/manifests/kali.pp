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

  host { 'demo1':
    ip           => "$demo1_ip",
  }

  host { 'demo2':
    ip           => "$demo2_ip",
  }

  if ($::ec2_local_ipv4 =~ /\d+/) {
    host { 'kali.external':
      ip => "$::ec2_local_ipv4"
    }
  } else {
    host { 'kali.external':
      ip => "$kali_ip"
    }
  }

  file { "/root/cve-2013-2251.rc":
    ensure => "file",
    mode   => 0644,
    owner  => "root",
    group  => "root",
    source => "puppet:///modules/demo_security/kali/cve-2013-2251.rc",
  }

  staging::file { 'ysoserial-0.0.2-all.jar':
    source => 'https://github.com/frohoff/ysoserial/releases/download/v0.0.2/ysoserial-0.0.2-all.jar',
    target => '/root/ysoserial-0.0.2-all.jar'
  }

  file { "/root/commons_rce_exploit.sh":
    ensure => "file",
    mode   => 0755,
    owner  => "root",
    group  => "root",
    content => template('demo_security/commons_rce_exploit.sh.erb')
  }

  file { "/root/reverse_shell.sh":
    ensure => "file",
    mode   => 0755,
    owner  => "root",
    group  => "root",
    content => template('demo_security/reverse_shell.sh.erb')
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

}

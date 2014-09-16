# == Class: vagrant_base_box
#
# Full description of class vagrant_base_box here.
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
#  class { vagrant_base_box:
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
class vagrant_base_box::users {

  $passwd_command = $::operatingsystem ? {
    Debian => '/bin/echo vagrant:vagrant | /usr/sbin/chpasswd',
    RedHat => '/bin/echo vagrant | /usr/bin/passwd --stdin vagrant'
  }

  # Create Vagrant user and ssh public key
  user { 'vagrant':
    ensure     => 'present',
    comment    => 'Vagrant User',
    shell      => '/bin/bash',
    home       => '/home/vagrant',
    managehome => true
  } ->

  exec { 'vagrant-passwd':
    command => "$passwd_command"
  } ->

  file { '/home/vagrant/.ssh':
    ensure => 'directory',
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => '0600'
  } ->

  ssh_authorized_key { 'vagrant insecure public key':
    ensure => 'present',
    key    => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
    type   => 'ssh-rsa',
    user   => 'vagrant'
  }

}

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
class vagrant_base_box::users inherits vagrant_base_box {

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
    mode   => '0700'
  } ->

  ssh_authorized_key { 'vagrant_insecure_public_key':
    ensure => 'present',
    key    => "$vagrant_insecure_public_key",
    type   => 'ssh-rsa',
    user   => 'vagrant'
  }

  if ($create_root_key) {
    file { '/root/.ssh':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0700'
    } ->

    ssh_authorized_key { 'vagrant_insecure_public_key-root':
      ensure => 'present',
      key    => "$vagrant_insecure_public_key",
      type   => 'ssh-rsa',
      user   => 'root'
    }    
  }

}

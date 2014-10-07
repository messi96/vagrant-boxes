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
class vagrant_base_box (
  $create_root_key             = $vagrant_base_box::params::create_root_key,
  $passwd_command              = $vagrant_base_box::params::passwd_command,
  $update_grub_command         = $vagrant_base_box::params::update_grub_command,
  $vagrant_insecure_public_key = $vagrant_base_box::params::vagrant_insecure_public_key
) inherits vagrant_base_box::params {

  class { '::vagrant_base_box::grub': }
  class { '::vagrant_base_box::network': }
  class { '::vagrant_base_box::sshd': }
  class { '::vagrant_base_box::sudoers': }
  class { '::vagrant_base_box::users': }

  file { '/etc/vagrant_box_build_time':
    content => strftime ("%c%n"),
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

}

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
class vagrant_base_box::grub inherits vagrant_base_box {

  if ($::osfamily == "RedHat") and ($::operatingsystemmajrelease == 6) {
    augeas { 'grub.conf':
      context => '/files/boot/grub/grub.conf',
      changes => [
        'set timeout 0'
      ],
    }
  }

  if ($::osfamily == "Debian") or (($::osfamily == 'RedHat') and ($::operatingsystemmajrelease == 7)) {
    augeas { 'grub.conf':
      context => '/files/etc/default/grub',
      changes => [
        'set GRUB_TIMEOUT 0'
      ],
    } ~>

    exec { 'update-grub':
      command     => "$update_grub_command",
      refreshonly => true
    }
  }

}

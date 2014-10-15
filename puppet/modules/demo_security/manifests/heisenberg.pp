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
class demo_security::heisenberg inherits demo_security {

  include '::oracle_xe'

  file { '/root/heisenberg':
    ensure => 'directory'
  } ->

  file { '/root/heisenberg/setupdb.sql':
    source  => 'puppet:///modules/profiles/heisenberg/setupdb.sql'
  } ~>

  exec { 'setup-db':
    command     => '/u01/app/oracle/product/11.2.0/xe/bin/sqlplus SYS/testpass@//127.0.0.1:1521/XE AS SYSDBA < /root/heisenberg/setupdb.sql',
    environment => [ 'ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe',
                     'ORACLE_SID=XE',
                     'NLS_LANG=ENGLISH_IRELAND.AL32UTF8',
                     'PATH=/u01/app/oracle/product/11.2.0/xe/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin' ],
    refreshonly => true,
    require     => Service['oracle-xe']
  }

}

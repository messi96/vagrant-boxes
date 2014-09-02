class profiles::demo_security::heisenberg {

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

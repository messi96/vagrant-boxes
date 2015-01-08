class demo_security::jforum inherits demo_security {

  staging::deploy { 'jforum-2.1.9.zip':
    source  => 'http://jforum.net/jforum-2.1.9.zip',
    target  => "${catalina_base}/webapps",
    creates => "${catalina_base}/webapps/jforum-2.1.9/index.htm",
    user    => "$demo_user",
    group   => "$demo_group"
  } ->

  file { "${catalina_base}/webapps/jforum-2.1.9/WEB-INF/config/SystemGlobals.properties":
    ensure      => 'file',
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644',
    source      => 'puppet:///modules/demo_security/jforum/SystemGlobals.properties',
  } ->

  file { "${catalina_base}/webapps/jforum-2.1.9/WEB-INF/config/modulesMapping.properties":
    ensure      => 'file',
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644',
    source      => 'puppet:///modules/demo_security/jforum/modulesMapping.properties',
  } ->

  file { "${catalina_base}/webapps/jforum-2.1.9/WEB-INF/config/database/oracle/oracle.properties":
    ensure      => 'file',
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644',
    source      => 'puppet:///modules/demo_security/jforum/oracle.properties',
  } ->

  file { "${catalina_base}/webapps/jforum-2.1.9/templates/default/images/logo.jpg":
    ensure      => 'file',
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644',
    source      => 'puppet:///modules/demo_security/jforum/logo.jpg',
  } ->

  file { '/root/jforum.sql':
    ensure      => 'file',
    mode        => '0644',
    source      => 'puppet:///modules/demo_security/jforum/jforum.sql',
  } ~>

  exec { 'setup-jforum-db':
    command     => "/u01/app/oracle/product/11.2.0/xe/bin/sqlplus SYS/testpass@//127.0.0.1:1521/XE AS SYSDBA < /root/jforum.sql",
    environment => [ 'ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe',
                     'ORACLE_SID=XE',
                     'NLS_LANG=ENGLISH_IRELAND.AL32UTF8',
                     'PATH=/u01/app/oracle/product/11.2.0/xe/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin' ],
    refreshonly => true,
    require     => Service['oracle-xe']
  }

}

class demo_security::spiracle inherits demo_security {

  include '::oracle_xe'

  tomcat::war { 'spiracle.war':,
    catalina_base => "$catalina_base",
    war_source    => "https://github.com/waratek/spiracle/releases/download/${spiracle_version}/spiracle.war"
  } ->

  file { "${catalina_base}/webapps/spiracle.war":
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644'
  } ->

  file { "${catalina_base}/webapps/spiracle":
    ensure      => "directory",
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0755'
  } ->

  exec { 'extract-spiracle-warfile':
    command     => "/usr/bin/jar -xf ${catalina_base}/webapps/spiracle.war",
    cwd         => "${catalina_base}/webapps/spiracle",
    creates     => "${catalina_base}/webapps/spiracle/index.jsp",
    user        => "${demo_user}",
    group       => "${demo_group}",
  } ~> 

  exec { 'setup-db':
    command     => "/u01/app/oracle/product/11.2.0/xe/bin/sqlplus SYS/testpass@//127.0.0.1:1521/XE AS SYSDBA < ${catalina_base}/webapps/spiracle/conf/setupdb.sql",
    environment => [ 'ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe',
                     'ORACLE_SID=XE',
                     'NLS_LANG=ENGLISH_IRELAND.AL32UTF8',
                     'PATH=/u01/app/oracle/product/11.2.0/xe/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin' ],
    refreshonly => true,
    require     => Service['oracle-xe']
  }

  file { "${catalina_base}/webapps/spiracle/WEB-INF/lib/ojdbc6.jar":
    ensure      => 'file',
    owner       => "${demo_user}",
    group       => "${demo_group}",
    mode        => '0644',
    source      => 'file:///u01/app/oracle/product/11.2.0/xe/jdbc/lib/ojdbc6.jar',
    require     => Exec['extract-spiracle-warfile']
  }

}

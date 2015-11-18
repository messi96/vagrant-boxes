class demo_security::jboss6 inherits demo_security {

  $source_url = 'http://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip'

  file { '/opt/jboss':
    ensure => 'directory',
    owner  => "${demo_user}",
    group  => "${demo_group}",
  } ->

  staging::deploy { 'jboss-as-distribution-6.1.0.Final.zip':
    source  => $source_url,
    target  => '/opt/jboss',
    user    => "${demo_user}",
    group   => "${demo_group}",
    creates => '/opt/jboss/jboss-6.1.0.Final'
  } ->

  file { "/opt/jboss/jboss-6.1.0.Final/bin/run.conf":
    ensure => "file",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    mode   => 0644,
    source => "puppet:///modules/demo_security/demo/jboss/run.conf",
  }

}

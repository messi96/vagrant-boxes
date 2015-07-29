class demo_security::httpd inherits demo_security {

  file { '/etc/httpd/conf.d/demo_vhost.conf':
    ensure      => 'file',
    owner       => 'root',
    group       => 'root',
    mode        => '0644',
    source      => 'puppet:///modules/demo_security/demo_vhost.conf',
  } ~>

  service { 'httpd':
    ensure => true,
    enable => true
  }

}

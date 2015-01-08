class demo_security::httpd inherits demo_security {

  file { '/etc/httpd/conf.d/demo_vhost.conf':
    ensure      => 'file',
    mode        => '0644',
    source      => 'puppet:///modules/demo_security/demo_vhost.conf',
  } ~>

  service { 'httpd':
    ensure => true,
    enable => true
  }

}

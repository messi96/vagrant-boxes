class demo_security::httpd inherits demo_security {

  ensure_packages('httpd', 'mod_security', 'mod_security_crs')

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

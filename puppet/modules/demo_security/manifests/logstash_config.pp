class demo_security::logstash_config inherits demo_security {

  file { '/etc/logstash/conf.d':
    ensure  => 'directory',
    source  => 'puppet:///modules/demo_security/logstash/conf.d',
    recurse => 'true',
    owner   => 'root',
    group   => 'root'
  }

}

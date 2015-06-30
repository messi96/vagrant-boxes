class demo_security::logstash_config inherits demo_security {

  logstash::configfile { 'logstash.conf':
    source => 'puppet:///modules/demo_security/logstash/conf.d/logstash.conf',
  }

}

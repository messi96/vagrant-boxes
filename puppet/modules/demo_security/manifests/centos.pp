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
class demo_security::centos inherits demo_security {

  host { 'demo1':
    ip           => "$demo1_ip",
  }

  host { 'demo2':
    ip           => "$demo2_ip",
  }

  host { 'kali':
    ip           => "$kali_ip",
  }

  host { 'monitor':
    ip           => "$monitor_ip",
  }

  file { "/home/${demo_user}/demo":
    ensure => "directory",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    mode   => 0755
  }

  file { "/home/${demo_user}/demo/reload_rules.sh":
    ensure => "file",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    mode   => 0755,
    source => "puppet:///modules/demo_security/demo/reload_rules.sh",
  }

  file { "/home/${demo_user}/demo/restart.sh":
    ensure => "absent",
  }

  file { "/home/${demo_user}/demo/jvc.rules":
    ensure => "file",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    mode   => 0644,
    source => "puppet:///modules/demo_security/demo/jvc.rules",
  }

  file { "/home/${demo_user}/demo/tomcat":
    ensure => "link",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    target => "/opt/apache-tomcat/tomcat7"
  }

  file { "/home/${demo_user}/demo/tomcat_startup.sh":
    ensure => "link",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    target => "/opt/apache-tomcat/tomcat7/bin/startup.sh"
  }

  file { "/home/${demo_user}/demo/tomcat_shutdown.sh":
    ensure => "link",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    target => "/opt/apache-tomcat/tomcat7/bin/shutdown.sh"
  }


  file { "/home/${demo_user}/demo/jboss":
    ensure => "link",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    target => "/opt/jboss/jboss-6.1.0.Final"
  }

  file { "/home/${demo_user}/demo/jboss_startup.sh":
    ensure => "link",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    target => "/opt/jboss/jboss-6.1.0.Final/bin/run.sh"
  }

  file { "/home/${demo_user}/demo/jboss_shutdown.sh":
    ensure => "link",
    owner  => "${demo_user}",
    group  => "${demo_group}",
    target => "/opt/jboss/jboss-6.1.0.Final/bin/shutdown.sh"
  }


  file { "/home/${demo_user}/demo/logProps.xml":
    ensure  => "file",
    owner   => "${demo_user}",
    group   => "${demo_group}",
    mode    => 0644,
    content => template('demo_security/logProps.xml.erb')
  }


  class { '::tomcat':
    user         => "$demo_user",
    group        => "$demo_group",
    manage_user  => false,
    manage_group => false
  }

  anchor { 'demo_security::begin': }     ->
  class  { '::demo_security::httpd': }  ->
  class  { '::demo_security::oracle_xe': }  ->
  class  { '::demo_security::jboss6': }  ->
  class  { '::demo_security::tomcat7': }  ->
  class  { '::demo_security::struts2': } ->
  class  { '::demo_security::spiracle': } ->
  class  { '::demo_security::webgoat': } ->
  class  { '::demo_security::jforum': } ->
  class  { '::demo_security::splunk_inputs': } ->
  class  { '::demo_security::logstash_config': } ->
  anchor { 'demo_security::end': }

}

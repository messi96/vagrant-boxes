class profiles::demo_security inherits profiles::base {

  class { "waratek": }

  class { "waratek::cloudvm-rpm":
    version => "2.6.5.GA.2.JAS-104"
  }

  class { "::waratek::demo_security": }
  file { "/home/${vagrantuser}/demo":
    ensure => "directory",
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => 0755
  }

  file { "/home/${vagrantuser}/demo/reload_rules.sh":
    ensure => "file",
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => 0755,
    source => "puppet:///modules/profiles/demo/security/reload_rules.sh",
  }

  include 'profiles::demo_security::tomcat'
  include '::sqlmap'
  file { "/home/${vagrantuser}/demo/restart.sh":
    ensure => "file",
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => 0755,
    source => "puppet:///modules/profiles/demo/security/restart.sh",
  }

  file { "/home/${vagrantuser}/demo/rules.jaf":
    ensure => "file",
    owner  => "${vagrantuser}",
    group  => "${vagrantuser}",
    mode   => 0644,
    source => "puppet:///modules/profiles/demo/security/rules.jaf",
  }

}

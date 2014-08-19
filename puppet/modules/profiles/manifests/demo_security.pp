class profiles::demo_security inherits profiles::base {

  class { "waratek": }

  class { "waratek::cloudvm-rpm":
    version => "2.6.5.GA.2.JAS-104"
  }

  class { "::waratek::demo_security": }

  class { "oracle_xe":
    version => "11.2.0-1.0",
  } ->

  service { "oracle-xe":
    ensure    => "running",
    enable    => "true",
    hasstatus => "false",
    pattern   => "tnslsnr"
  }

  include 'profiles::demo_security::tomcat'
  include '::sqlmap'

}

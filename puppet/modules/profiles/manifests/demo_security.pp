class profiles::demo_security inherits profiles::base {

  class { "waratek": }

  class { "waratek::cloudvm-rpm":
    version => "2.6.5.GA.2.JAS-104"
  }

  class { "::waratek::demo_security": }

  include 'profiles::demo_security::tomcat'
  include '::sqlmap'

}

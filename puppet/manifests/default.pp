
node default {
    include common
}

node 'kali' {
    include common

    host { 'target':
        ensure => 'present',
        ip     => '192.168.100.101'

    }
}

node 'target' {
    class { "waratek": }

    class { 'waratek::cloudvm-rpm':
        version     =>  '2.6.1.alpha.4-001'
    }

    class { 'tomcat':
        tomcat_version => '7.0.53',
    }

    class { 'tomcat::struts_demo':
        tomcat_version => '7.0.53',
        struts_version => '2.2.1.1'
    }
}

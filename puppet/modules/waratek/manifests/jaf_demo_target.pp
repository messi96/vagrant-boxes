class waratek::jaf_demo_target() {

    class { 'waratek': }

    class { 'waratek::cloudvm-rpm':
        version     =>  '2.6.1.alpha.4-001'
    }

    class { 'tomcat':
        tomcat_version => '7.0.53',
    }

    class { 'tomcat::struts_examples':
        tomcat_version => '7.0.53',
        struts_version => '2.2.1.1'
    }

    file { "/home/${vagrantuser}/jaf_demo":
        ensure => 'directory',
        owner  => "${vagrantuser}",
        group  => "${vagrantuser}",
        mode   => 0755
    }

    file { "/home/${vagrantuser}/jaf_demo/restart.sh":
        ensure => 'file',
        owner  => "${vagrantuser}",
        group  => "${vagrantuser}",
        mode   => 0755,
        source => 'puppet:///modules/waratek/jaf_demo/restart.sh',
    }

    file { "/home/${vagrantuser}/jaf_demo/rules.jaf":
        ensure => 'file',
        owner  => "${vagrantuser}",
        group  => "${vagrantuser}",
        mode   => 0664,
        source => 'puppet:///modules/waratek/jaf_demo/rules.jaf',
    }

}
class waratek::jaf_demo_sqlmap() {

    class { 'waratek': }
    include waratek::cloudvm-common

    class { 'sqlmap': }

    class { 'oracle_xe':
        version => '11.2.0-1.0',
    }

    service { "oracle-xe":
        ensure    => "running",
        enable    => "true",
        hasstatus => "false",
        pattern   => "tnslsnr"
    }

    class { 'tomcat':
        tomcat_version => "7.0.54"
    }

    tomcat::tomcat_instance { "/home/vagrant/tomcat":
        port  => "8080",
        owner => "vagrant",
        group => "vagrant"
    }

    # service { "httpd":
    #     ensure  => "running",
    #     enable  => "true",
    #     require => Package["httpd"]
    # }

    # service { "mysqld":
    #     ensure  => "running",
    #     enable  => "true",
    #     require => Package["mysql-server"]
    # }


}

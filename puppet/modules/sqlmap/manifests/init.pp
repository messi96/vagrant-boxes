class sqlmap {

    package { "gcc":          ensure => "installed" }
    package { "httpd":        ensure => "installed" }
    package { "mysql-server": ensure => "installed" }
    package { "php":          ensure => "installed" }
    package { "php-devel":    ensure => "installed" }
    package { "php-gd":       ensure => "installed" }
    package { "php-mysql":    ensure => "installed" }
    package { "php-odbc":     ensure => "installed" }
    package { "php-pear":     ensure => "installed" }

    exec { "clone-sqlmap":
        command => "/usr/bin/git clone https://github.com/sqlmapproject/sqlmap.git",
        cwd     => "/home/${vagrantuser}",
        user    => "${vagrantuser}",
        group   => "${vagrantuser}",
        creates => "/home/${vagrantuser}/sqlmap/.git",
    }

    exec { "clone-testenv":
        command => "/usr/bin/git clone https://github.com/sqlmapproject/testenv.git sqlmap",
        cwd     => "/var/www/html",
        creates => "/var/www/html/sqlmap/.git",
        notify  => Exec["setup-db"]
    }

    file { "/root/sqlmap.sql":
        source  => "puppet:///modules/sqlmap/sqlmap.sql"
    }

    file { "/root/setupdb.sh":
        source  => "puppet:///modules/sqlmap/setupdb.sh",
        mode    => "0755"
    }

    exec { "setup-db":
        command     => "/root/setupdb.sh",
        refreshonly => "true",
        require     => [ File["/root/sqlmap.sql", "/root/setupdb.sh"], Package["oracle-xe"], Exec["clone-testenv"] ],
        notify      => Service["oracle-xe"]
    }

    service { "httpd":
        ensure => "running",
        enable => "true"
    }

    service { "oracle-xe":
        ensure    => "running",
        enable    => "true",
        hasstatus => "false",
        pattern   => "tnslsnr"
    }

}

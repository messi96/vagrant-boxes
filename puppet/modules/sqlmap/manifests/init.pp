class sqlmap {

    # package { "gcc":          ensure => "installed" }
    # package { "httpd":        ensure => "installed" }
    # package { "mysql-server": ensure => "installed" }
    # package { "php":          ensure => "installed" }
    # package { "php-devel":    ensure => "installed" }
    # package { "php-gd":       ensure => "installed" }
    # package { "php-mysql":    ensure => "installed" }
    # package { "php-odbc":     ensure => "installed" }
    # package { "php-pear":     ensure => "installed" }

    file { [ "/var/www", "/var/www/html" ]:
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => "0755"
    }

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
        require => [ File["/var/www/html"], Package["git"] ],
        notify  => Exec["setup-db"]
    }

    file { "/root/sqlmap":
        ensure => "directory"
    }

    file { "/root/sqlmap/data.sql":
        source  => "puppet:///modules/sqlmap/data.sql"
    }

    file { "/root/sqlmap/create_user.sql":
        source  => "puppet:///modules/sqlmap/create_user.sql"
    }

    file { "/root/sqlmap/system.sql":
        source  => "puppet:///modules/sqlmap/system.sql"
    }

    file { "/root/sqlmap/setupdb.sh":
        source  => "puppet:///modules/sqlmap/setupdb.sh",
        mode    => "0755"
    }

    exec { "setup-db":
        command     => "/root/sqlmap/setupdb.sh",
        refreshonly => "true",
        require     => [ File["/root/sqlmap/data.sql", "/root/sqlmap/create_user.sql", "/root/sqlmap/system.sql", "/root/sqlmap/setupdb.sh"], Exec["oracle-xe-configure"], Exec["clone-testenv"] ],
        notify      => Service["oracle-xe"]
    }


}

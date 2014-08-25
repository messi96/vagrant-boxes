class profiles::demo_security::heisenberg {

    include '::oracle_xe'
    include '::sqlmap'

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
        require     => [ File["/root/sqlmap/data.sql", "/root/sqlmap/create_user.sql", "/root/sqlmap/system.sql", "/root/sqlmap/setupdb.sh"] ],
        notify      => Service["oracle-xe"]
    }

}

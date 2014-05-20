class oracle_xe ( $version ) {

    package { "oracle-xe":
        ensure   => $version,
        source   => "http://rpm/vagrant/oracle-xe-${version}.x86_64.rpm",
        provider => "rpm"
    }

    file { "/root/xe.rsp":
        ensure   => "present",
        source   => "puppet:///modules/oracle_xe/xe.rsp",
        owner    => "root",
        group    => "root",
        mode     => "0600"
    }

    exec { "oracle-xe-configure":
        command  => "/etc/init.d/oracle-xe configure responseFile=/root/xe.rsp",
        creates  => "/etc/sysconfig/oracle-xe",
        require  => [ Package [ "oracle-xe"], File [ "/root/xe.rsp"] ]
    }

}

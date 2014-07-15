class oracle_xe ( $version ) {


    exec { "install-oracle-xe":
        command  => "/bin/rpm -i /vagrant/synced_folder/oracle-xe-${version}.x86_64.rpm || /bin/rpm -i http://rpm/vagrant/oracle-xe-${version}.x86_64.rpm",
        creates  => "/etc/init.d/oracle-xe",
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
        require  => [ Exec [ "install-oracle-xe"], File [ "/root/xe.rsp"] ]
    }

    file { "/etc/profile.d/oracle-xe.sh":
        ensure => 'file',
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => 'puppet:///modules/oracle_xe/etc/profile.d/oracle-xe.sh',
    }

}

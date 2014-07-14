class waratek::cloudvm-common {

    include waratek::cgroups

    package { 'acl':
        ensure      =>  'installed'
    }

    user { 'waratek':
        ensure => 'present',
        gid    => 'waratek',
        shell  => '/sbin/nologin',
        home   => '/var/lib/javad'
    }

    group { 'waratek':
        ensure      =>  'present'
    }

    user { $vagrantuser:
        ensure      =>  'present',
        groups      =>  'waratek',
    }

    file { "/var/lib/javad":
        ensure => directory,
        owner  => "waratek",
        group  => "waratek",
        mode   => 2775
    }

    file { "/etc/init.d/javad":
        ensure =>  "present",
        owner  =>  "root",
        group  =>  "root",
        mode   =>  "0755",
        source =>  "puppet:///modules/waratek/etc/init.d/javad",
    }

    file { "/etc/sysconfig/javad":
        ensure =>  "present",
        owner  =>  "root",
        group  =>  "root",
        mode   =>  "0644",
        source =>  "puppet:///modules/waratek/etc/sysconfig/javad",
    }

}

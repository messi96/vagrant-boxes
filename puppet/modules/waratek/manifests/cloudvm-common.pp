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

}

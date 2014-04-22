class waratek {

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

    class { "iptables": }

    class { "waratek::license": }
    class { "waratek::motd": }

    include cgroups
    include packages

}

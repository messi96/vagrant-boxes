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

    package { 'acl':
        ensure      =>  'installed'
    }

    class { "iptables": }

    package { 'java-1.6.0-openjdk':
        ensure      =>  'installed'
    }

    package { 'java-1.6.0-openjdk-devel':
        ensure      =>  'installed'
    }

    package { 'libcgroup':
        ensure      =>  'installed',
        name        =>  $::operatingsystem ? {
            'SLES'  =>  'libcgroup1',
            default =>  'libcgroup'
        }
    }

    if ( $::operatingsystem == "SLES" ) {
        file { '/etc/cgconfig.conf':
            ensure  =>  'present',
            source  =>  'puppet:///modules/waratek/cgconfig.conf.SLES',
            require =>  Package[ 'libcgroup' ]
        }
    } else {
        file { '/etc/cgconfig.conf':
            ensure  =>  'present',
            require =>  Package[ 'libcgroup' ]
        }
    }

    service { 'cgconfig':
        ensure      => 'running',
        enable      => 'true',
        require     =>  [   Package[ 'libcgroup' ], 
                            File[ '/etc/cgconfig.conf' ]
                        ]
    }

    class { "waratek::license": }
    class { "waratek::motd": }

}

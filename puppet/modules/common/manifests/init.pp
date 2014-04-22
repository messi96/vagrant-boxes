class common {
    file { '/etc/localtime':
        ensure  => 'link',
        target  => '/usr/share/zoneinfo/UTC',
        seltype => 'etc_t'
    }

    package { 'git':
        ensure      =>  'installed',
        name        =>  $operatingsystem ? {
            'SLES'  =>  'git-core',
            default =>  'git'
        }
    }

    if ( $osfamily == "RedHat" ) {

        class { "iptables": }

        package { 'acl':
            ensure      =>  'installed'
        }

        package { 'htop':
            ensure      =>  'installed'
        }

        package { 'java-1.6.0-openjdk':
            ensure      =>  'installed'
        }

        package { 'java-1.6.0-openjdk-devel':
            ensure      =>  'installed'
        }

    }
}


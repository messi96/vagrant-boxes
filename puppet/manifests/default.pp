node default {

    package { 'acl':
        ensure      =>  'installed'
    }

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

        package { 'htop':
            ensure      =>  'installed'
        }

        class { 'waratek::cloudvm-rpm':
            version     =>  '2.5.5.GA.2-95'
        }

        class { 'waratek::elasticat':
            version     =>  '1.3.2-86'
        }
    }

    if ( $operatingsystem == "SLES" ) {
        class { 'waratek::cloudvm-tgz':
            version     =>  '2.5.5.GA.2-87'
        }
    }

}

node default {

    package { 'acl':
        ensure      =>  'installed'
    }

    file { '/etc/localtime':
        ensure => 'link',
        target => '/usr/share/zoneinfo/UTC'
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
    }

    if ( $operatingsystem == "SLES" ) {
        class { 'waratek::cloudvm-tgz':
            version     =>  '2.5.5.GA.2-87'
        }
    }

}

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

    class { "waratek": }
    class { "iptables": }

    if ( $osfamily == "RedHat" ) {

        package { 'htop':
            ensure      =>  'installed'
        }

        package { 'java-1.6.0-openjdk':
            ensure      =>  'installed'
        }

        package { 'java-1.6.0-openjdk-devel':
            ensure      =>  'installed'
        }

        class { 'waratek::cloudvm-rpm':
            version     =>  '2.5.5.GA.2-95'
        }

        class { 'tomcat':
            tomcat_version => '7.0.53',
            struts_version => '2.2.1.1'
        }
    }

}

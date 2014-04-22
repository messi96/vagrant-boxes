class cgroups {

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

}

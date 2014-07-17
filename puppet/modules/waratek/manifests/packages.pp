class packages {

    package { 'java-1.6.0-openjdk':
        ensure      =>  'installed'
    }

    package { 'java-1.6.0-openjdk-devel':
        ensure      =>  'installed'
    }

    package { 'git':
        ensure      =>  'installed',
        name        =>  $operatingsystem ? {
            'SLES'  =>  'git-core',
            default =>  'git'
        }
    }

    package { 'htop':
        ensure      =>  'installed'
    }

}

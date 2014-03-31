class waratek::license() {

    file { '/usr/local/bin/display_license.sh':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
        source => 'puppet:///modules/waratek/display_license.sh',
    }

    file { "/home/${vagrantuser}/.bash_profile":
        ensure => 'file',
        owner  => "${vagrantuser}",
        group  => "${vagrantuser}",
        mode   => '0644',
        source => 'puppet:///modules/waratek/.bash_profile',
    }

    exec { 'install-license':
        command => "/bin/cp /vagrant/LICENSE_KEY /var/lib/javad",
        onlyif  => "/usr/bin/test -r /vagrant/LICENSE_KEY",
        creates => "/var/lib/javad/LICENSE_KEY",
        require => File[ '/var/lib/javad' ]
    }

}

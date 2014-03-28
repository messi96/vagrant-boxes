class waratek::license() {

    exec { 'install-license':
        command => "/bin/cp /vagrant/LICENSE_KEY /var/lib/javad",
        onlyif  => "/usr/bin/test -r /vagrant/LICENSE_KEY",
        creates => "/var/lib/javad/LICENSE_KEY",
        require => File[ '/var/lib/javad' ]
    }

}

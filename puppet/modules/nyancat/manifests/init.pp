class nyancat {

    package { "xinetd":
        ensure => "installed"
    } ->

    file { "/etc/xinetd.d/nyancat":
        ensure => file,
        source => "puppet:///modules/nyancat/xinetd.d/nyancat",
        owner  => "root",
        group  => "root",
        mode   => 644,
        notify => Service["xinetd"]
    } ->

    file { "/usr/local/sbin/nyancat":
        ensure => file,
        source => "puppet:///modules/nyancat/sbin/nyancat",
        owner  => "root",
        group  => "root",
        mode   => 755,
    }

    service { "xinetd":
        ensure => "running",
        enable => "true"
    }
}

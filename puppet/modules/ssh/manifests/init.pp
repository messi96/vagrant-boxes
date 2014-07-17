class ssh {

    file { "/etc/ssh/ssh_config":
        ensure => file,
        source => "puppet:///modules/ssh/ssh_config",
        owner  => "root",
        group  => "root",
        mode   => 644
    }

    file { "/etc/ssh/sshd_config":
        ensure => file,
        source => "puppet:///modules/ssh/sshd_config",
        owner  => "root",
        group  => "root",
        mode   => 600,
        notify => Service["sshd"]
    }

    service { "sshd":
        ensure => "running",
        enable => "true"
    }
}

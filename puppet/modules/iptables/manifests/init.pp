class iptables {

    file { "/etc/sysconfig/iptables":
        ensure => file,
        source => "puppet:///modules/iptables/iptables",
        owner  => "root",
        group  => "root",
        mode   => 600,
        notify => Service['iptables']
    }

    service { 'iptables':
        ensure => "running"
    }
}

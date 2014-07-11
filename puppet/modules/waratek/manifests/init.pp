class waratek {

    file { "/etc/profile.d/waratek.sh":
        ensure => 'file',
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => 'puppet:///modules/waratek/etc/profile.d/waratek.sh',
    }

    class { "iptables": }

    class { "waratek::license": }
    class { "waratek::motd": }

    include packages

}

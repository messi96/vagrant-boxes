class waratek::jaf_demo_attacker() {

    host { "target":
        ensure => "present",
        ip     => "192.168.100.101"

    }
    
    file { "/root/demo":
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => 0755
    }

    file { "/root/demo/cve-2013-2251.rc":
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => 0644,
        source => "puppet:///modules/waratek/demo/security/cve-2013-2251.rc",
    }


    file { "/root/demo/exploit.sh":
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => 0755,
        source => "puppet:///modules/waratek/demo/security/exploit.sh",
    }

}

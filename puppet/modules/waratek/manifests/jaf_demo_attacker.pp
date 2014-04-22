class waratek::jaf_demo_attacker() {

    host { 'target':
        ensure => 'present',
        ip     => '192.168.100.101'

    }
    
    file { "/root/jafdemo":
        ensure => 'directory',
        owner  => "root",
        group  => "root",
        mode   => 0755
    }

    file { "/root/jafdemo/cve-2013-2251.rc":
        ensure => 'file',
        owner  => "root",
        group  => "root",
        mode   => 0644,
        source => 'puppet:///modules/waratek/jaf_demo/cve-2013-2251.rc',
    }

}

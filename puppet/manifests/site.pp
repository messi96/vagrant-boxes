
include common

if ($waratek_demo == "jaf_demo_attacker") {
    host { 'target':
        ensure => 'present',
        ip     => '192.168.100.101'

    }
}

if ($waratek_demo == "jaf_demo_target") {
    class { "waratek::jaf_demo_target": }
}



include common

if ($waratek_demo == "jaf_demo_client") {
    host { 'target':
        ensure => 'present',
        ip     => '192.168.100.101'

    }
}

if ($waratek_demo == "jaf_demo_server") {
    class { "waratek::jaf_demo": }
}


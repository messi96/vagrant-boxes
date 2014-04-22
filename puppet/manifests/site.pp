
include common

if ($waratek_demo == "jaf_demo_attacker") {
    class { "waratek::jaf_demo_attacker": }
}

if ($waratek_demo == "jaf_demo_target") {
    class { "waratek::jaf_demo_target": }
}


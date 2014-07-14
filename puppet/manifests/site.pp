
class { "ssh": }

if ($waratek_demo) {
    class { "waratek::$waratek_demo": }
}


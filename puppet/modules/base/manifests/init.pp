class base {

    package { [
        "bc",
        "byobu",
        "htop",
        "java-1.6.0-openjdk",
        "java-1.6.0-openjdk-devel",
        "unzip",
        "vim-enhanced",
        "wget"
        ]:
            ensure => "installed"
    }

    package { "git":
        ensure      =>  "installed",
        name        =>  $operatingsystem ? {
            "SLES"  =>  "git-core",
            default =>  "git"
        }
    }

    service { [ "iptables", "ip6tables" ]:
        ensure => "running",
        enable => "true"
    }
}

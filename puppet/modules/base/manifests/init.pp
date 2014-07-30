
class base {

    package { [
    	"bc",
        "byobu",
        "git",
        "htop",
        "java-1.6.0-openjdk",
        "java-1.6.0-openjdk-devel",
        "unzip",
        "vim-enhanced",
        "wget"
        ]:
            ensure => "installed"
    }

    service { [ "iptables", "ip6tables" ]:
        ensure => "running",
        enable => "true"
    }
}

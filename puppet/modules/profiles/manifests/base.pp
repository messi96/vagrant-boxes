class profiles::base {

    class { 'java':
      package => 'java-1.6.0-openjdk-devel'
    }

    package { [
        "bc",
        "byobu",
        "htop",
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

}

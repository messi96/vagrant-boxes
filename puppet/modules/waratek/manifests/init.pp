class waratek {

    class { "iptables": }

    class { "waratek::license": }
    class { "waratek::motd": }

    include packages

}

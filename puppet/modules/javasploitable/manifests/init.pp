class javasploitable inherits base {

    package { [
        "tomcat",
        "tomcat-admin-webapps",
        ]:
            ensure => "installed"
    }

    file { "/var/lib/tomcat/webapps/ROOT":
        ensure  => "directory",
        owner   => "tomcat",
        group   => "tomcat",
        mode    => "0755",
        require => Package["tomcat"]
    }

    file { "/var/lib/tomcat/webapps/ROOT/index.html":
        source => "puppet:///modules/javasploitable/tomcat/ROOT/index.html",
        owner  => "tomcat",
        group  => "tomcat",
        mode   => "0644"
    }

    class { 'motd':
        template => 'javasploitable/etc/motd',
    }

    Service [ "iptables", "ip6tables" ] {
        ensure => "stopped",
        enable => "false"
    }

    user { "javasploitable":
        ensure     => "present",
        home       => "/home/javasploitable",
        managehome => "true"
    } ->

    ssh_authorized_key { "vagrant-insecure-key":
        ensure => "present",
        key    => "AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==",
        type   => "ssh-rsa",
        user   => "javasploitable"
    }

}

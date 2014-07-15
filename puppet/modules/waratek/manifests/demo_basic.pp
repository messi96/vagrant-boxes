class waratek::demo_basic() {

    class { "waratek": }

    class { "waratek::cloudvm-rpm":
        version => "2.6.5.GA.2-103"
    }

    class { "waratek::elasticat":
        version     =>  "1.3.2-86"
    }

    class { "tomcat":
        tomcat_version => "7.0.54"
    }

    tomcat::tomcat_instance { "tomcat1":
        base_dir => "/home/${vagrantuser}/tomcat1",
        port     => "8081",
        owner    => "${vagrantuser}",
        group    => "${vagrantuser}"
    }

    tomcat::tomcat_instance { "tomcat2":
        base_dir => "/home/${vagrantuser}/tomcat2",
        port     => "8082",
        owner    => "${vagrantuser}",
        group    => "${vagrantuser}"
    }

    tomcat::tomcat_instance { "tomcat3":
        base_dir => "/home/${vagrantuser}/tomcat3",
        port     => "8083",
        owner    => "${vagrantuser}",
        group    => "${vagrantuser}"
    }

    tomcat::tomcat_instance { "tomcat4":
        base_dir => "/home/${vagrantuser}/tomcat4",
        port     => "8084",
        owner    => "${vagrantuser}",
        group    => "${vagrantuser}"
    }

}

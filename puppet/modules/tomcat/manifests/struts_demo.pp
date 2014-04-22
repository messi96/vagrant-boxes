class struts_demo ( $tomcat_version, $struts_version ) {

    $tomcat_dir = "apache-tomcat-${tomcat_version}"

    $struts_examples_dir = "struts-${struts_version}"
    $struts_examples_archive = "${struts_examples_dir}-apps.zip"
    $struts_examples_url = "https://archive.apache.org/dist/struts/examples/struts-${struts_version}-apps.zip"

    exec { 'download-struts-examples':
        command     =>  "/usr/bin/curl $struts_examples_url -o /home/${vagrantuser}/${struts_examples_archive}",
        cwd         =>  "/home/${vagrantuser}/",
        creates     =>  "/home/${vagrantuser}/${struts_examples_archive}",
        onlyif      =>  "/usr/bin/test ! -r /home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank.war",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}"
    }

    exec { 'extract-struts-examples':
        command     =>  "/usr/bin/unzip /home/${vagrantuser}/${struts_examples_archive}",
        cwd         =>  "/home/${vagrantuser}/",
        creates     =>  "/home/${vagrantuser}/$struts_examples_dir/NOTICE.txt",
        onlyif      =>  "/usr/bin/test ! -r /home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank.war",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        require     =>  Exec[ 'download-struts-examples', 'extract-tomcat' ]
    }

    exec { 'deploy-struts-examples':
        command     =>  "/bin/cp /home/${vagrantuser}/${struts_examples_dir}/apps/struts2-blank.war /home/${vagrantuser}/${tomcat_dir}/webapps",
        creates     =>  "/home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank.war",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        require     =>  Exec[ 'extract-tomcat', 'extract-struts-examples' ]
    }

    file { "/home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank":
        ensure      =>  "directory",
        owner       =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        mode        =>  0755,
        require     =>  Exec[ "extract-tomcat"]
    }

    exec { 'extract-struts-warfile':
        command     =>  "/usr/bin/jar -xf /home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank.war",
        cwd         =>  "/home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank",
        creates     =>  "/home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank/index.html",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        require     =>  [ Exec[ 'deploy-struts-examples' ], File[ "/home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank" ] ]
    }

    exec { 'cleanup-struts-examples':
        command     =>  "/bin/rm -rf ${struts_examples_dir} ${struts_examples_archive}",
        cwd         =>  "/home/${vagrantuser}/",
        onlyif      =>  "/usr/bin/test -r /home/${vagrantuser}/${struts_examples_dir} || /usr/bin/test -r /home/${vagrantuser}/${struts_examples_archive}",
        require     =>  Exec[ 'deploy-struts-examples' ]
    }

    file { "/home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank/example/HelloWorld.jsp":
        ensure      =>  "present",
        owner       =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        mode        =>  0644,
        source      =>  "puppet:///modules/struts_demo/HelloWorld.jsp",
        require     =>  Exec[ 'extract-struts-warfile' ]
    }

}

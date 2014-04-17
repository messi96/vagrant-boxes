class tomcat ( $tomcat_version, $struts_version ) {

    $tomcat_dir = "apache-tomcat-${tomcat_version}"
    $tomcat_archive = "${tomcat_dir}.tar.gz"
    $tomcat_download_url = "http://ftp.heanet.ie/mirrors/www.apache.org/dist/tomcat/tomcat-7/v${tomcat_version}/bin/${tomcat_archive}"

    $struts_examples_dir = "struts-${struts_version}"
    $struts_examples_archive = "${struts_examples_dir}-apps.zip"
    $struts_examples_url = "https://archive.apache.org/dist/struts/examples/struts-${struts_version}-apps.zip"

    exec { 'download-tomcat':
        command     =>  "/usr/bin/curl $tomcat_download_url -o /home/${vagrantuser}/${tomcat_archive}",
        cwd         =>  "/home/${vagrantuser}/",
        creates     =>  "/home/${vagrantuser}/${tomcat_archive}",
        onlyif      =>  "/usr/bin/test ! -r /home/${vagrantuser}/${tomcat_dir}/RUNNING.txt",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}"
    }

    exec { 'extract-tomcat':
        command     =>  "/bin/tar zxf /home/${vagrantuser}/${tomcat_archive}",
        cwd         =>  "/home/${vagrantuser}/",
        creates     =>  "/home/${vagrantuser}/${tomcat_dir}/RUNNING.txt",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        require     =>  Exec[ 'download-tomcat' ]
    }

    exec { 'cleanup-tomcat':
        command     =>  "/bin/rm -f /home/${vagrantuser}/${tomcat_archive}",
        onlyif      =>  "/usr/bin/test -r /home/${vagrantuser}/${tomcat_archive}",
        require     =>  Exec[ 'extract-tomcat' ]
    }

    exec { 'download-struts-examples':
        command     =>  "/usr/bin/curl $struts_examples_url -o /home/${vagrantuser}/${struts_examples_archive}",
        cwd         =>  "/home/${vagrantuser}/",
        creates     =>  "/home/${vagrantuser}/${struts_examples_archive}",
        onlyif      =>  "/usr/bin/test ! -r /home/${vagrantuser}/$struts_examples_dir/NOTICE.txt",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}"
    }

    exec { 'extract-struts-examples':
        command     =>  "/usr/bin/unzip /home/${vagrantuser}/${struts_examples_archive}",
        cwd         =>  "/home/${vagrantuser}/",
        creates     =>  "/home/${vagrantuser}/$struts_examples_dir/NOTICE.txt",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        require     =>  Exec[ 'download-struts-examples' ]
    }

    exec { 'deploy-struts-examples':
        command     =>  "/bin/cp /home/${vagrantuser}/${struts_examples_dir}/apps/struts2-blank.war /home/${vagrantuser}/${tomcat_dir}/webapps",
        creates     =>  "/home/${vagrantuser}/${tomcat_dir}/webapps/struts2-blank.war",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        require     =>  Exec[ 'extract-tomcat', 'extract-struts-examples' ]
    }

    exec { 'cleanup-struts-examples':
        command     =>  "/bin/rm -rf ${struts_examples_dir} ${struts_examples_archive}",
        cwd         =>  "/home/${vagrantuser}/",
        onlyif      =>  "/usr/bin/test -r /home/${vagrantuser}/${struts_examples_dir} || /usr/bin/test -r /home/${vagrantuser}/${struts_examples_archive}",
        require     =>  Exec[ 'deploy-struts-examples' ]
    }


}

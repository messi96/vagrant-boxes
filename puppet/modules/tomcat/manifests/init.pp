class tomcat ( $tomcat_version ) {

    $tomcat_dir = "apache-tomcat-${tomcat_version}"
    $tomcat_archive = "${tomcat_dir}.tar.gz"
    $tomcat_download_url = "http://ftp.heanet.ie/mirrors/www.apache.org/dist/tomcat/tomcat-7/v${tomcat_version}/bin/${tomcat_archive}"

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

}

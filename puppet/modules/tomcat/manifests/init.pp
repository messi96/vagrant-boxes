class tomcat ( $tomcat_version ) {

    $base_dir = "/opt"
    $install_dir = "${base_dir}/apache-tomcat-${tomcat_version}"
    $tomcat_tgz = "apache-tomcat-${tomcat_version}.tar.gz"
    $tomcat_download_url = "http://archive.apache.org/dist/tomcat/tomcat-7/v${tomcat_version}/bin/${tomcat_tgz}"

    exec { "download-tomcat":
        command     =>  "/usr/bin/curl $tomcat_download_url -o ${base_dir}/${tomcat_tgz}",
        cwd         =>  "$base_dir",
        creates     =>  "$base_dir/${tomcat_tgz}",
        onlyif      =>  "/usr/bin/test ! -r ${install_dir}/RUNNING.txt",
    }

    exec { "extract-tomcat":
        command     =>  "/bin/tar zxf ${base_dir}/${tomcat_tgz}",
        cwd         =>  "$base_dir",
        creates     =>  "$install_dir/RUNNING.txt",
        require     =>  Exec[ "download-tomcat" ]
    }

    file { "/opt/apache-tomcat":
        ensure      =>  "link",
        target      =>  "$install_dir"
    }


    exec { "cleanup-tomcat":
        command     =>  "/bin/rm -f ${base_dir}/${tomcat_tgz}",
        onlyif      =>  "/usr/bin/test -r ${base_dir}/${tomcat_tgz}",
        require     =>  Exec[ "extract-tomcat" ]
    }

}

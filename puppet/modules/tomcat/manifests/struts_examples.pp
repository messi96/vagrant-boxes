class tomcat::struts_examples ( $webapps_dir, $struts_version, $owner, $group ) {

    $tmp_dir = "/tmp"

    $struts_examples_dir = "struts-${struts_version}"
    $struts_examples_zip = "struts-${struts_version}-apps.zip"
    $struts_examples_url = "https://archive.apache.org/dist/struts/examples/struts-${struts_version}-apps.zip"

    exec { "download-struts-examples":
        command     =>  "/usr/bin/curl $struts_examples_url -o ${tmp_dir}/${struts_examples_zip}",
        cwd         =>  "${tmp_dir}",
        creates     =>  "${tmp_dir}/${struts_examples_zip}",
        onlyif      =>  "/usr/bin/test ! -r ${webapps_dir}/struts2-blank.war",
        user        =>  "${owner}",
        group       =>  "${group}"
    }

    exec { "extract-struts-examples":
        command     =>  "/usr/bin/unzip ${tmp_dir}/${struts_examples_zip}",
        cwd         =>  "${tmp_dir}",
        creates     =>  "${tmp_dir}/${struts_examples_dir}/NOTICE.txt",
        onlyif      =>  "/usr/bin/test ! -r ${webapps_dir}/struts2-blank.war",
        user        =>  "${owner}",
        group       =>  "${group}",
        require     =>  Exec[ "download-struts-examples" ]
    }

    exec { "deploy-struts-examples":
        command     =>  "/bin/cp ${tmp_dir}/${struts_examples_dir}/apps/struts2-blank.war ${webapps_dir}",
        creates     =>  "${webapps_dir}/struts2-blank.war",
        user        =>  "${owner}",
        group       =>  "${group}",
        require     =>  Exec[ "extract-struts-examples" ]
    }

    file { "${webapps_dir}/struts2-blank":
        ensure      =>  "directory",
        owner       =>  "${owner}",
        group       =>  "${group}",
        mode        =>  0755
    }

    exec { "extract-struts-warfile":
        command     =>  "/usr/bin/jar -xf ${webapps_dir}/struts2-blank.war",
        cwd         =>  "${webapps_dir}/struts2-blank",
        creates     =>  "${webapps_dir}/struts2-blank/index.html",
        user        =>  "${owner}",
        group       =>  "${group}",
        require     =>  [ Exec[ "deploy-struts-examples" ], File[ "${webapps_dir}/struts2-blank" ] ]
    }

    exec { "cleanup-struts-examples":
        command     =>  "/bin/rm -rf ${struts_examples_dir} ${struts_examples_zip}",
        cwd         =>  "${tmp_dir}",
        onlyif      =>  "/usr/bin/test -r ${tmp_dir}/${struts_examples_dir} || /usr/bin/test -r ${tmp_dir}/${struts_examples_zip}",
        require     =>  Exec[ "deploy-struts-examples" ]
    }

    file { "${webapps_dir}/struts2-blank/example/HelloWorld.jsp":
        ensure      =>  "present",
        owner       =>  "${owner}",
        group       =>  "${group}",
        mode        =>  0644,
        source      =>  "puppet:///modules/tomcat/HelloWorld.jsp",
        require     =>  Exec[ "extract-struts-warfile" ]
    }

}

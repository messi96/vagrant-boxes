class roller::install inherits roller {
	
    exec { "download-roller.war":
        command => "/usr/bin/wget -q $roller_war_url",
        cwd     => "$tomcat_webapps_dir",
        creates => "${tomcat_webapps_dir}/${roller_war_file}",
        user    => "tomcat",
        group   => "tomcat",
        require => Package [ "tomcat" ]
    }

    exec { "download-javax.mail.jar":
        command => "/usr/bin/wget -q http://java.net/projects/javamail/downloads/download/javax.mail.jar",
        cwd     => "$tomcat_lib_dir",
        creates => "${tomcat_lib_dir}/${javax_mail_jar_file}",
        require => Package [ "tomcat" ]
    }

}
class javasploitable::roller {
	
    # $home_dir = "/home/javasploitable"

    # file { "${home_dir}/rollerdata/roller.sql":
    #     source  => "puppet:///modules/javasploitable/roller.sql",
    #     owner   => "javasploitable",
    #     group   => "javasploitable",
    # }


    exec { "download-javax.mail.jar":
        command => "/usr/bin/wget -q http://java.net/projects/javamail/downloads/download/javax.mail.jar",
        cwd     => "/usr/share/tomcat/lib",
        creates => "/usr/share/tomcat/lib/javax.mail.jar",
        require => Package [ "tomcat" ]
    }



    # file { "${home_dir}/tomcat/lib/mysql-connector-java-5.1.31-bin.jar":
    #     source  => "puppet:///modules/javasploitable/tomcat/lib/mysql-connector-java-5.1.31-bin.jar",
    #     owner   => "javasploitable",
    #     group   => "javasploitable",
    # }

    # file { "${home_dir}/tomcat/lib/roller-custom.properties":
    #     source  => "puppet:///modules/javasploitable/tomcat/lib/roller-custom.properties",
    #     owner   => "javasploitable",
    #     group   => "javasploitable",
    # }

    # file { "${home_dir}/tomcat/webapps/roller.war":
    #     source  => "puppet:///modules/javasploitable/tomcat/webapps/roller-5.0.1-tomcat.war",
    #     recurse => "true",
    #     owner   => "javasploitable",
    #     group   => "javasploitable",
    # }

    # file { [ "${home_dir}/rollerdata",
    #          "${home_dir}/rollerdata/logs",
    #          "${home_dir}/rollerdata/mediafiles",
    #          "${home_dir}/rollerdata/searchindex" ]:
    #     ensure => "directory",
    #     owner   => "javasploitable",
    #     group   => "javasploitable",    
    # }

}
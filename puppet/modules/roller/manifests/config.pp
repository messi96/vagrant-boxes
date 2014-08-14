class roller::config inherits roller {
	
    file { "${tomcat_lib_dir}/roller-custom.properties":
        content => template ("roller/roller-custom.properties"),
        owner   => "tomcat",
        group   => "tomcat",
        mode    => "0644",
        require => Package [ "tomcat" ]
    }

}
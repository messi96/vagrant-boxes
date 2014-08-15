class roller::config inherits roller {
	
    file { "${tomcat_lib_dir}/roller-custom.properties":
        content => template ("roller/roller-custom.properties"),
        owner   => "tomcat",
        group   => "tomcat",
        mode    => "0644",
        require => Package [ "tomcat" ]
    }

    file { "/root/roller":
        ensure  => "directory",
        owner   => "root",
        group   => "root"
    }

    file { "/root/roller/rollerdb.sql":
        source  => "puppet:///modules/roller/rollerdb.sql",
        owner   => "root",
        group   => "root"
    }

    file { [ "${roller_data_dir}",
             "${roller_data_dir}/logs",
             "${roller_data_dir}/mediafiles",
             "${roller_data_dir}/searchindex" ]:
        ensure => "directory",
        owner  => "tomcat",
        group  => "tomcat",    
    }

}
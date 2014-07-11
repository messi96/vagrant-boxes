define tomcat::tomcat_instance ( $base_dir = $title, $port, $owner, $group ) {

    $connector_port = $port
    $server_port = $port - 75
    $redirect_port = $port + 363
    
    file { [ "${base_dir}",
             "${base_dir}/bin",
             "${base_dir}/lib",
             "${base_dir}/logs",
             "${base_dir}/temp",
             "${base_dir}/work" ]:
        ensure => "directory",
        owner  => "$owner",
        group  => "$group",
        mode   => "0755"
    }

    file { "${base_dir}/bin/tomcat-juli.jar":
        ensure => "link",
        target => "/opt/apache-tomcat/bin/tomcat-juli.jar",
        owner  => "$owner",
        group  => "$group",
        mode   => "0755"
    }

    file { "${base_dir}/conf":
        source  => "puppet:///modules/tomcat/conf",
        recurse => "true",
        owner   => "$owner",
        group   => "$group",
    }

    file { "${base_dir}/conf/server.xml":
        content => template ("tomcat/conf/server.xml"),
        owner   => "$owner",
        group   => "$group",
    }

    file { "${base_dir}/bin/startup.sh":
        ensure  => "file",
        content => template ("tomcat/bin/startup.sh"),
        owner   => "$owner",
        group   => "$group",
        mode    => "0755"
    }

    exec { "${base_dir}/webapps":
        command => "/bin/cp -r /opt/apache-tomcat/webapps ${base_dir}",
        user    => "$owner",
        group   => "$group",
        creates => "${base_dir}/webapps",
        require => File [ "${base_dir}" ]
    }

}
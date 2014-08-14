class elasticsearch ( $version ) {

    $elasticsearch_rpm_url = "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${version}.noarch.rpm"

    package { "elasticsearch":
        ensure   => "installed",
        provider => "rpm",
        source   => "$elasticsearch_rpm_url"
    }

    service { "elasticsearch":
	    ensure  => "running",
	    enable  => "true",
	    require => Package["elasticsearch"],
        notify  => Exec["elasticsearch-dummy-data"]
    }

    # Ensure there's some dummy data in the index:
    exec { "elasticsearch-dummy-data":
        command     => "/usr/bin/curl -XPUT 'localhost:9200/test/test/1' -d '{ \"message\": \"Hello, World!\" }'",
        refreshonly => "true",
        tries       => 10,
        try_sleep   => 10
    }

}
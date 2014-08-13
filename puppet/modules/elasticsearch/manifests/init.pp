class elasticsearch ( $version ) {

    package { "elasticsearch":
        ensure   => "installed",
        provider => "rpm",
        source   => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${version}.noarch.rpm"
    }

    service { "elasticsearch":
	    ensure  => "running",
	    enable  => "true",
	    require => Package["elasticsearch"]
    }

}
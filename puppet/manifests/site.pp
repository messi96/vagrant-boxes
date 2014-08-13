
include base
include ssh

if ($node_type == "javasploitable") {
	include javasploitable
	include nyancat

	class { "elasticsearch":
		version => "1.1.1"
	}
}


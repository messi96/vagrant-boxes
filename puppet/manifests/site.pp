
include base
include ssh

if ($node_type == "javasploitable") {
	include javasploitable
	include nyancat
}


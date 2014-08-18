
File { backup => false }

include base
include ssh

if ($node_type == "javasploitable") {
    include javasploitable
    include '::mysql::server'
    include nyancat

    class { "elasticsearch":
        version      => "1.1.1-1",
        manage_repo  => true,
        repo_version => "1.1",
        status       => 'enabled'
    }

    class { "roller":
        version => "5.0.1"
    }
if ($node_type) {
  include "profiles::$node_type"
}



File { backup => false }

class { 'staging':
  path => '/tmp/staging'
}

if ($node_type) {
  include "profiles::$node_type"
}

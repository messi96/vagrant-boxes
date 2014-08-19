
File { backup => false }

class { 'staging':
  path => '/tmp/staging'
}

include 'profiles::base'

if ($node_type) {
  include "profiles::$node_type"
}


File { backup => false }

if ($node_type) {
  include "profiles::$node_type"
}

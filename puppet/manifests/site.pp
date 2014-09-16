
File { backup => false }
Package { allow_virtual => false }

if ($osfamily == 'Debian') {
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

  Exec['apt-update'] -> Package <| |>
}

hiera_include('classes')


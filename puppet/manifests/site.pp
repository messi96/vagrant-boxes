
Exec { timeout => 600 }
File { backup => false }
Package { allow_virtual => false }

if ($osfamily == 'Debian') {
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

  Exec['apt-update'] -> Package <| |>
}

ensure_packages(hiera_array('packages'))
hiera_include('classes')


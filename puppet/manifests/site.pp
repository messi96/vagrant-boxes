
Exec { timeout => 600 }
File { backup => false }
Package { allow_virtual => false }

$module_path_tmp = split($settings::modulepath, ':')
$vagrant_module_path = $module_path_tmp[0]
notice("Puppet module path is: $settings::modulepath")
notice("Vagrant host module path is: ${vagrant_module_path}")

if ($osfamily == 'Debian') {
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

  Exec['apt-update'] -> Package <| |>
}

ensure_packages(hiera_array('packages'))
hiera_include('classes')


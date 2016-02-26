class waratek_rules(
  $app_rules       = undef,
  $default_rules   = undef,
  $reload_script   = undef,
  $rulefile_group  = 'root',
  $rulefile_mode   = '0600',
  $rulefile_name   = undef,
  $rulefile_owner  = 'root',
  $sqli_protection = true,
  $sqli_loglevel   = 'warn',
  $xss_protection  = true,
  $xss_loglevel    = 'warn'

) {

  if $sqli_protection {
    $sqli_action = 'deny'
  } else {
    $sqli_action = 'allow'
  }

  if $xss_protection {
    $xss_action = 'deny'
  } else {
    $xss_action = 'allow'
  }

  if $rulefile_name {
    file { "$rulefile_name":
      ensure  => 'present',
      owner   => "$rulefile_owner",
      group   => "$rulefile_group",
      mode    => "$rulefile_mode",
      content => template('waratek_rules/jvc.rules.erb'),
      notify  => Exec["$reload_script"]
    }
  } else {
      warning ("No filename specified")
  }

  if $reload_script {
    exec { "$reload_script":
      refreshonly => true
    }
  }

}

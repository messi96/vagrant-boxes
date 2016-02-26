class demo_security::foreman_custom {

  file { '/usr/share/foreman/app/views/dashboard/index.html.erb':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source => 'puppet:///modules/demo_security/foreman/index.html.erb',
    notify  => Service[ 'httpd' ],
    require => Class[ 'foreman' ],
  }

  file { '/usr/share/foreman/app/views/users/login.html.erb':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source => 'puppet:///modules/demo_security/foreman/login.html.erb',
    notify  => Service[ 'httpd' ],
    require => Class[ 'foreman' ],
  }

  file { '/usr/share/foreman/app/views/home/_topbar.html.erb':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source => 'puppet:///modules/demo_security/foreman/_topbar.html.erb',
    notify  => Service[ 'httpd' ],
    require => Class[ 'foreman' ],
  }

  file { '/tmp/header_logo.png':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/demo_security/foreman/header_logo.png',
  }

  file { '/tmp/login_logo.png':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/demo_security/foreman/login_logo.png',
  }

  file { '/tmp/favicon.ico':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/demo_security/foreman/favicon.ico',
  }

  file { '/tmp/overwrite_logos.sh':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
    source => 'puppet:///modules/demo_security/foreman/overwrite_logos.sh',
  }

  exec { 'overwrite-logos':
    command => '/tmp/overwrite_logos.sh',
    require => [  Class[ 'foreman' ],
                  File[ '/tmp/overwrite_logos.sh' ],
                  File[ '/tmp/header_logo.png' ],
                  File[ '/tmp/login_logo.png' ],
                  File[ '/tmp/favicon.ico' ], ],
  }

  file { '/tmp/update_css.sh':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
    source => 'puppet:///modules/demo_security/foreman/update_css.sh',
  }

  exec { 'update-css':
    command => '/tmp/update_css.sh',
    require => [  Class[ 'foreman' ],
                  File[ '/tmp/update_css.sh' ], ],
  }

  # Enable Apache mod proxy
  file { '/etc/httpd/conf.d/proxy.load':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => "LoadModule proxy_module modules/mod_proxy.so\nLoadModule proxy_http_module modules/mod_proxy_http.so\n",
    notify  => Service[ 'httpd' ],
  }

  file { '/etc/httpd/conf.d/99-foreman-custom.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source => 'puppet:///modules/demo_security/foreman/99-foreman-custom.conf',
    notify  => Service[ 'httpd' ],
  }
  

}

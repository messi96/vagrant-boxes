class demo_security::foreman_custom {

  exec { 'add-iframe':
    command => "/bin/sed -i -e 's/<div class=\"row\">/<div class=\"row\"><div align=\"center\"><iframe src=\"\\/kibana\\/app\\/kibana#\\/dashboard\\/Waratek-Dashboard?embed\\&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:now-15m,mode:quick,to:now))\\&_a=(filters:!(),options:(darkTheme:!t),panels:!((col:1,id:Waratek-Events,panelIndex:1,row:1,size_x:12,size_y:3,type:visualization),(col:1,columns:!(severity,rule_action,rule_category,rule_subcategory,host,jvc_name),id:Waratek-All-Events,panelIndex:2,row:6,size_x:12,size_y:3,sort:!('@timestamp',desc),type:search),(col:1,id:Denied-events-by-category-chart,panelIndex:3,row:4,size_x:3,size_y:2,type:visualization),(col:4,id:Denied-events-by-category,panelIndex:4,row:4,size_x:3,size_y:2,type:visualization),(col:7,id:Allowed-events-by-category-chart,panelIndex:5,row:4,size_x:3,size_y:2,type:visualization),(col:10,id:Allowed-events-by-category,panelIndex:6,row:4,size_x:3,size_y:2,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:'*')),title:'Waratek%20Dashboard',uiState:())\" height=\"800\" width=\"1000\"><\\/iframe><\\/div>/g' /usr/share/foreman/app/views/dashboard/index.html.erb",
    unless  => '/bin/grep kibana /usr/share/foreman/app/views/dashboard/index.html.erb',
    notify  => Service[ 'httpd' ],
    require => Class[ 'foreman' ],
  }

  exec { 'change-login-text':
    command => "/bin/sed -i -e 's/Welcome to Foreman/Welcome to the Waratek Management Console/g' /usr/share/foreman/app/views/users/login.html.erb",
    unless  => '/bin/grep Waratek /usr/share/foreman/app/views/users/login.html.erb',
    notify  => Service[ 'httpd' ],
    require => Class[ 'foreman' ],
  }

  exec { 'change-topbar-text':
    command => "/bin/sed -i -e 's/Foreman/Waratek Management Console/g' /usr/share/foreman/app/views/home/_topbar.html.erb",
    unless  => '/bin/grep Waratek /usr/share/foreman/app/views/home/_topbar.html.erb',
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

class splunk_dashboard {

  vcsrepo { '/opt/splunk/etc/apps/waratek':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/prateepb/splunk-test-app.git',
    user     => 'splunk',
    require  => Package['splunk'],
    notify   => Service['splunk']
  }
  
}

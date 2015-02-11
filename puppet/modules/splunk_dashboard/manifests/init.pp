class splunk_dashboard {

  vcsrepo { '/opt/splunk/etc/apps/waratek':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/prateepb/splunk-test-app.git',
    user     => 'splunk',
    require  => Package['splunk'],
    notify   => Service['splunk']
  } ->

  file { '/opt/splunk/etc/apps/waratek/local/inputs.conf':
  	ensure => present,
  	source => 'puppet:///modules/splunk_dashboard/inputs.conf',
  	owner  => 'splunk',
  	group  => 'splunk',
  	mode   => '0644'
  }
  
}

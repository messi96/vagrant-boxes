class profiles::sqlmap {

  vcsrepo { '/opt/sqlmap':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/sqlmapproject/sqlmap.git',
  }

  vcsrepo { '/var/www/html/sqlmap':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/sqlmapproject/testenv.git',
  }


}

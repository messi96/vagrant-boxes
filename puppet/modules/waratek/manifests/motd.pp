class waratek::motd() {

    file { '/etc/cron.hourly/motd':
        ensure      =>  'present',
        owner       =>  'root',
        group       =>  'root',
        mode        =>  '0755',
        source      =>  'puppet:///modules/waratek/motd',
        notify      =>  Exec[ 'motd' ]
    }

    exec { 'motd':
        command     =>  '/etc/cron.hourly/motd',
        refreshonly =>  true,
        require     =>  File[ '/etc/cron.hourly/motd' ]
    }

}

class waratek::jaf_demo() {

    file { [ '/var/lib/javad/jvm-1',
           '/var/lib/javad/jvm-1/jafdemo' ]:
        ensure => 'directory',
        owner  => "${vagrantuser}",
        group  => "waratek",
        mode   => 2770
    }

    file { '/var/lib/javad/jvm-1/jafdemo/rules.jaf':
        ensure => 'file',
        owner  => "${vagrantuser}",
        group  => "${vagrantuser}",
        mode   => 0664,
        source => 'puppet:///modules/waratek/jaf_demo/rules.jaf',
    }

}

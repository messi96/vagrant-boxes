class waratek::jaf_demo_sqlmap() {

    class { 'waratek': }
    include waratek::cloudvm-common

    class { 'oracle_xe':
        version => '11.2.0-1.0',
    }

    class { 'sqlmap': }

}

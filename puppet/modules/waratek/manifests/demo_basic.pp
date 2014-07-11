class waratek::demo_basic() {

    class { 'waratek': }

    class { 'waratek::cloudvm-rpm':
        version => "2.6.5.GA.2-103"
    }

    class { 'waratek::elasticat':
        version     =>  '1.3.2-86'
    }


}

class waratek::demo_basic() {

    class { 'waratek': }

    class { 'waratek::cloudvm-rpm':
        version     =>  '2.6.0.GA.1-99'
    }

    class { 'waratek::elasticat':
        version     =>  '1.3.2-86'
    }


}

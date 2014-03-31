class waratek::elasticat( $version ) {

    exec { 'download-elasticat':
        command     =>  "/usr/bin/curl http://www.elasticat.com/release/waratek-elasticat-${version}.tar.gz?src=vagrant -o /home/${vagrantuser}/waratek-elasticat-${version}.tar.gz",
        cwd         =>  "/home/${vagrantuser}/",
        creates     =>  "/home/${vagrantuser}/waratek-elasticat-${version}.tar.gz",
        onlyif      =>  "/usr/bin/test ! -r /home/${vagrantuser}/waratek-elasticat-${version}/RUNNING.txt",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}"
    }

    exec { 'extract-elasticat':
        command     =>  "/bin/tar zxf /home/${vagrantuser}/waratek-elasticat-${version}.tar.gz",
        cwd         =>  "/home/${vagrantuser}/",
        creates     =>  "/home/${vagrantuser}/waratek-elasticat-${version}/RUNNING.txt",
        user        =>  "${vagrantuser}",
        group       =>  "${vagrantuser}",
        require     =>  Exec[ 'download-elasticat' ]
    }

    exec { 'cleanup-elasticat':
        command     =>  "/bin/rm -f /home/${vagrantuser}/waratek-elasticat-${version}.tar.gz",
        onlyif      =>  "/usr/bin/test -r /home/${vagrantuser}/waratek-elasticat-${version}.tar.gz",
        require     =>  Exec[ 'extract-elasticat' ]
    }
}

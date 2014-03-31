/*
 * Installs the Waratek JVM with version specified by $version
 * 
 */
class waratek::cloudvm-tgz( $version ) {

    # Install latest version of JVM

    if ( $operatingsystem == "CentOS" and $operatingsystemrelease >= 6 ) or
       ( $operatingsystem == "SLES" and $operatingsystemrelease >= 11.1 ) {
        exec { 'download-tgz':
            command     =>  "/usr/bin/curl http://download.waratek.com/tgz/waratek_release_${version}_package.tar.gz?src=vagrant -o /opt/waratek_release_${version}_package.tar.gz",
            cwd         =>  "/opt/",
            creates     =>  "/opt/waratek_release_${version}_package.tar.gz"
        }

        exec { 'extract-tgz':
            command     =>  "/bin/tar zxf /opt/waratek_release_${version}_package.tar.gz",
            cwd         =>  '/opt/',
            creates     =>  "/opt/waratek_release_${version}_package/CHANGELOG",
            require     =>  Exec[ 'download-tgz' ]
        }

        # Installs the TGZ release
        exec { 'install-tgz':
            command     =>  "/opt/waratek_release_${version}_package/tools/autoinstall.sh -s -u vagrant -a -g add",
            cwd         =>  "/opt/waratek_release_${version}_package/tools",
            creates     =>  "/usr/lib/jvm/java-1.6.0-waratek-${version}.x86_64/jre/LICENSE",
            require     =>  Exec[ 'extract-tgz' ]
        }

        # exec { 'cleanup-tgz':
        #     command     =>  "/bin/rm -f /opt/waratek_release_${version}_package.tar.gz",
        #     #require     =>  Exec[ 'extract-tgz' ]
        # }
    } else {
        err ("Waratek tgz installation is not available for this operating system release")
    }

}

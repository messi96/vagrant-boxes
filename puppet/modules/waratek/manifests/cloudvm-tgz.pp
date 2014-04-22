/*
 * Installs the Waratek JVM with version specified by $version
 * 
 */
class waratek::cloudvm-tgz( $version ) {

    include cloudvm-common

    # Install latest version of JVM

    if ( $operatingsystem == "CentOS" and $operatingsystemrelease >= 6 ) or
       ( $operatingsystem == "SLES" and $operatingsystemrelease >= 11.1 ) {
        exec { 'download-tgz':
            command     =>  "/usr/bin/wget http://download.waratek.com/tgz/waratek_release_${version}_package.tar.gz?src=vagrant -O /opt/waratek_release_${version}_package.tar.gz",
            cwd         =>  "/opt/",
            creates     =>  "/vagrant/synced_folder/waratek_release_${version}_package.tar.gz"
        }

        exec { 'extract-tgz':
            command     =>  "/bin/tar zxf /vagrant/synced_folder/waratek_release_${version}_package.tar.gz",
            cwd         =>  '/opt/',
            creates     =>  "/opt/waratek_release_${version}_package/CHANGELOG",
            require     =>  Exec[ 'download-tgz' ]
        }

        # Installs the TGZ release
        exec { 'install-tgz':
            command     =>  "/opt/waratek_release_${version}_package/tools/autoinstall.sh -s -u vagrant -a -g add",
            cwd         =>  "/opt/waratek_release_${version}_package/tools",
            creates     =>  "/usr/lib/jvm/java-1.6.0-waratek-${version}.x86_64/jre/LICENSE",
            require     =>  Exec[ 'extract-tgz' ],
            notify      =>  Exec[ 'alternatives-java' ]
        }

        exec { 'alternatives-java':
            command     =>  '/usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.6.0-waratek.x86_64/bin/java',
            refreshonly =>  true,
            require     =>  Exec[ 'install-tgz' ]
        }

        # exec { 'cleanup-tgz':
        #     command     =>  "/bin/rm -f /opt/waratek_release_${version}_package.tar.gz",
        #     #require     =>  Exec[ 'extract-tgz' ]
        # }
    } else {
        err ("Waratek tgz installation is not available for this operating system release")
    }

}

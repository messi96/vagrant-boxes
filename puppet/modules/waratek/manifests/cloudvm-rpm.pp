/*
 * Installs the Waratek JVM with version specified by $version
 * 
 */
class waratek::cloudvm-rpm( $version ) {

    $rpm1 = "/vagrant/synced_folder/java-1.6.0-waratek-${version}.x86_64.rpm"
    $rpm2 = "http://download.waratek.com/rpm/x86_64/java-1.6.0-waratek-${version}.x86_64.rpm?src=vagrant"

    include waratek::cloudvm-common

    # Install latest version of JVM

    if ( $operatingsystem == "RedHat" or $operatingsystem == "CentOS" ) and
       ( $operatingsystemrelease >= 6 ) {

        # Import GPG public key
        exec { 'waratek-gpg-key':
            command     =>  '/bin/rpm --import http://download.waratek.com/keys/107183FC.txt?src=vagrant',
            unless      =>  '/bin/rpm -q gpg-pubkey-107183fc'
        }

        exec { "install-cloudvm-rpm":
            command     =>  "/bin/rpm -U $rpm1 || /bin/rpm -U $rpm2",
            creates     =>  "/usr/lib/jvm/java-1.6.0-waratek-${version}.x86_64",
            require     =>  [   Exec[ 'waratek-gpg-key' ],
                                Package[ 'acl', 'libcgroup' ],
                                Group[ 'waratek' ],
                                Service[ 'cgconfig' ]
            before      =>  File[ "/etc/init.d/javad", "/etc/sysconfig/javad" ],
                            ],
            notify      =>  Exec[ 'alternatives-java' ]
        }

        exec { 'alternatives-java':
            command     =>  '/usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.6.0-waratek.x86_64/bin/java',
            refreshonly =>  true,
            require     =>  Exec[ "install-cloudvm-rpm" ]
        }

    } else {
        err ("Waratek rpm installation is not available for this operating system release")
    }

}

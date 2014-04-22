/*
 * Installs the Waratek JVM with version specified by $version
 * 
 */
class waratek::cloudvm-rpm( $version ) {

    include cloudvm-common

    # Install latest version of JVM

    if ( $operatingsystem == "RedHat" or $operatingsystem == "CentOS" ) and
       ( $operatingsystemrelease >= 6 ) {

        # Import GPG public key
        exec { 'waratek-gpg-key':
            command     =>  '/bin/rpm --import http://download.waratek.com/keys/107183FC.txt?src=vagrant',
            unless      =>  '/bin/rpm -q gpg-pubkey-107183fc'
        }

        package { 'java-1.6.0-waratek':
            ensure      =>  $version,
            source      =>  "/vagrant/synced_folder/java-1.6.0-waratek-${version}.x86_64.rpm",
            provider    =>  'rpm',
            require     =>  [   Exec[ 'waratek-gpg-key' ],
                                Package[ 'acl', 'libcgroup' ],
                                Group[ 'waratek' ],
                                Service[ 'cgconfig' ]
                            ],
            notify      =>  Exec[ 'alternatives-java' ]
        }

        exec { 'alternatives-java':
            command     =>  '/usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.6.0-waratek.x86_64/bin/java',
            refreshonly =>  true,
            require     =>  Package[ 'java-1.6.0-waratek' ]
        }

    } else {
        err ("Waratek rpm installation is not available for this operating system release")
    }

}

class roller ( $version) {
	
    $tomcat_lib_dir       = "/usr/share/java/tomcat"
    $tomcat_webapps_dir   = "/var/lib/tomcat/webapps"
    $javax_mail_jar_file  = "javax.mail.jar"
    $javax_mail_jar_url   = "http://java.net/projects/javamail/downloads/download/${javax_mail_jar_file}"
    $roller_war_file      = "roller-${version}-tomcat.war"
    $roller_war_url       = "https://s3.amazonaws.com/waratek-download/vulnerable-apps/$roller_war_file"
    $roller_data_dir      = "/var/lib/roller"

    include roller::install
    include roller::config

}
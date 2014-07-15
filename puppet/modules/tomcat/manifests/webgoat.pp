class tomcat::webgoat ( $webapps_dir, $owner, $group ) {

    $webgoat_war = "WebGoat.war"
    $webgoat_url = "https://webgoat.googlecode.com/files/WebGoat-5.4.war"

    exec { "download-webgoat":
        command     =>  "/usr/bin/curl $webgoat_url -o ${webapps_dir}/${webgoat_war}",
        cwd         =>  "${webapps_dir}",
        creates     =>  "${webapps_dir}/${webgoat_war}",
        user        =>  "${owner}",
        group       =>  "${group}"
    }

}

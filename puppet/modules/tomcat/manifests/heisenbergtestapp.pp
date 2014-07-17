class tomcat::heisenbergtestapp ( $webapps_dir, $owner, $group ) {

    $testapp_war = "HeisenbergTestApp.war"
    $testapp_path = "/vagrant/synced_folder/${testapp_war}"

    exec { "deploy-testapp":
        command     =>  "/bin/cp ${testapp_path} ${webapps_dir}",
        cwd         =>  "${webapps_dir}",
        creates     =>  "${webapps_dir}/${testapp_war}",
        user        =>  "${owner}",
        group       =>  "${group}"
    }

}

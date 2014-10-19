class profiles::demo_basic {

  $tomcat_instances = hiera('tomcat::instances', {})
  create_resources('tomcat::instance', $tomcat_instances)

}

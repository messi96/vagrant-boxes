class profiles::demo_basic inherits profiles::base {

  $tomcat_instances = hiera('tomcat::instances', {})
  create_resources('tomcat::instance', $tomcat_instances)

}

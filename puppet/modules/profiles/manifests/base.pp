class profiles::base {

  augeas { "ssh_config":
    context => "/files/etc/ssh/ssh_config/Host[.='*']",
    changes => [
      "set StrictHostKeyChecking no",
      "set UserKnownHostsFile /dev/null"
    ],
  }

}

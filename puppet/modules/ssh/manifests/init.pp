class ssh {

  augeas { "ssh_config":
    context => "/files/etc/ssh/ssh_config/Host[.='*']",
    changes => [
      "set StrictHostKeyChecking no",
      "set UserKnownHostsFile /dev/null"
    ],
  }

  augeas { "sshd_config":
    context => "/files/etc/ssh/sshd_config",
    changes => [
      "set PermitRootLogin no",
      "set UseDNS no"
    ],
  }

}

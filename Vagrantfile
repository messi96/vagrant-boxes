# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "waratek/demo"
  config.vm.hostname = "demo1.localdomain"

  # VirtualBox
  config.vm.provider :virtualbox do |vb|
    vb.name = "Waratek Demo"
    vb.customize ["modifyvm", :id, "--biosbootmenu", "disabled"]
    vb.customize ["modifyvm", :id, "--bioslogodisplaytime", "0"]
    vb.customize ["modifyvm", :id, "--bioslogofadein", "off"]
    vb.customize ["modifyvm", :id, "--bioslogofadeout", "off"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--memory", "1536"]
  end

  # AWS
  config.vm.provider :aws do |aws,override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET_KEY']
    aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
    aws.region = ENV['AWS_REGION']
    override.ssh.private_key_path = ENV['AWS_PRIVATE_KEY']
    override.ssh.username = "vagrant"

    aws.user_data = File.read("scripts/cloud-init.sh")
  end

  config.vm.provision "shell", path: "scripts/puppet-bootstrap.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.facter = {
      "vagrantuser" => "vagrant"
    }
  end

end

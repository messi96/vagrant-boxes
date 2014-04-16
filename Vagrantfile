# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "waratek/demo"
  config.vm.hostname = "demo1.localdomain"

  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Waratek Demo"
    vb.customize ["modifyvm", :id, "--biosbootmenu", "disabled"]
    vb.customize ["modifyvm", :id, "--bioslogodisplaytime", "0"]
    vb.customize ["modifyvm", :id, "--bioslogofadein", "off"]
    vb.customize ["modifyvm", :id, "--bioslogofadeout", "off"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--memory", "1536"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  # AWS
  config.vm.provider "aws" do |aws,override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET_KEY']
    aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
    aws.region = ENV['AWS_REGION']
    override.ssh.private_key_path = ENV['AWS_PRIVATE_KEY_PATH']
    override.ssh.username = "vagrant"

    aws.user_data = File.read("scripts/cloud-init.sh")
    aws.tags = {
        'Name' => 'Waratek Demo',
        'User' => ENV['USER']
    }
  end

  # VMware Fusion
  config.vm.provider "vmware_fusion" do |vmf|
    vmf.vmx["memsize"] = "1536"
    vmf.vmx["numvcpus"] = "4"
  end

  config.vm.provision "shell", path: "scripts/puppet-bootstrap.sh"

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    #puppet.options = "--verbose --debug"
    puppet.facter = {
      "vagrantuser" => "vagrant"
    }
  end

end

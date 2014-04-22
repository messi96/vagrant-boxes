# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Kali
  config.vm.define "kali" do |kali|
    kali.vm.box = "kali-linux-i386-mini"
    kali.vm.hostname = "kali.localdomain"
    kali.ssh.username = "root"
    kali.vm.guest = "debian"
    kali.vm.network "private_network", ip: "192.168.100.100"

    kali.vm.provider "virtualbox" do |vb|
      vb.name = "Kali Linux (Mini)"
      vb.customize ["modifyvm", :id, "--biosbootmenu", "disabled"]
      vb.customize ["modifyvm", :id, "--bioslogodisplaytime", "0"]
      vb.customize ["modifyvm", :id, "--bioslogofadein", "off"]
      vb.customize ["modifyvm", :id, "--bioslogofadeout", "off"]
      vb.customize ["modifyvm", :id, "--ioapic", "off"]
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    kali.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "puppet/modules"
      #puppet.options = "--verbose --debug"
    end
  end

  # CentOS
  config.vm.define "centos" do |centos|
    centos.vm.box = "waratek/demo"
    centos.vm.hostname = "target.localdomain"

    centos.vm.network "private_network", ip: "192.168.100.101"
    centos.vm.network "forwarded_port", guest: 80, host: 8000
    centos.vm.network "forwarded_port", guest: 8080, host: 8080

    # VirtualBox
    centos.vm.provider "virtualbox" do |vb|
      vb.name = "Waratek Demo"
      vb.customize ["modifyvm", :id, "--biosbootmenu", "disabled"]
      vb.customize ["modifyvm", :id, "--bioslogodisplaytime", "0"]
      vb.customize ["modifyvm", :id, "--bioslogofadein", "off"]
      vb.customize ["modifyvm", :id, "--bioslogofadeout", "off"]
      vb.customize ["modifyvm", :id, "--cpus", "4"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    end

    # VMware Fusion
    centos.vm.provider "vmware_fusion" do |vmf|
      vmf.vmx["memsize"] = "512"
      vmf.vmx["numvcpus"] = "4"
    end

    centos.vm.provision "shell", path: "scripts/puppet-bootstrap.sh"

    centos.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "puppet/modules"
      #puppet.options = "--verbose --debug"
      puppet.facter = {
        "vagrantuser"  => "vagrant",
        "waratek_demo" => "jaf_demo_target"
      }
    end

  end


end

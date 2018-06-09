# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://github.com/dustymabe/vagrant-sshfs
unless Vagrant.has_plugin?("vagrant-sshfs")
  raise 'vagrant-sshfs is not installed!'
end

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "sandbox"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.network "private_network", ip: "192.168.33.200"

  # prevent compromised vm overwriting vagrant files...
  config.vm.synced_folder ".", "/vagrant", type: "rsync",
    rsync__exclude: [ ".git", "shared" ]

  config.vm.synced_folder "shared", "/vagrant/shared", type: "sshfs"
  config.vm.provision "shell", path: "provision/scripts/provision.sh"
end

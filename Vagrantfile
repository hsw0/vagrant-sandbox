# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LANG"] = "en_US.UTF-8"
ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure(2) do |config|
  config.vagrant.plugins = ["vagrant-sshfs"]

  config.vm.box = "centos/8"
  config.vm.box_url = "http://cloud.centos.org/centos/8/vagrant/x86_64/images/CentOS-8-Vagrant-8.2.2004-20200611.2.x86_64.vagrant-virtualbox.box"
  config.vm.box_download_checksum_type = "sha256"
  config.vm.box_download_checksum = "698b0d9c6c3f31a4fd1c655196a5f7fc224434112753ab6cb3218493a86202de"

  config.vm.hostname = "sandbox"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.linked_clone = true
  end

  #config.vm.network "private_network", ip: "192.168.33.200"

  # prevent compromised vm overwriting vagrant files...
  config.vm.synced_folder ".", "/vagrant", type: "rsync",
    rsync__exclude: [ ".git", "shared" ]

  config.vm.synced_folder "shared", "/vagrant/shared", type: "sshfs"
  config.vm.provision "shell", path: "provision/provision.sh"
end

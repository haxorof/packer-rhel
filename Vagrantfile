# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  # Guest additions not install during packaging
  config.vm.synced_folder '.', '/vagrant', disabled: true

  # VirtualBox.
  config.vm.define "virtualbox" do |virtualbox|
    virtualbox.vm.hostname = "virtualbox-redhat7"
    virtualbox.vm.box = "redhat/7"
    virtualbox.vm.box_url = "file://builds/virtualbox-redhat7.box"

    config.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 1024
      v.cpus = 1
    end

    config.vm.provision "shell", inline: "echo Hello, World"
  end

end

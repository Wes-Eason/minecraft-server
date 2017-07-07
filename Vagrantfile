# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "debian/jessie64"

    config.vm.network "forwarded_port",
      guest: 25565,
      host: 25565

    config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = "4"
    end

    config.vm.provision "shell",
        path: "setup/provision.sh"
end

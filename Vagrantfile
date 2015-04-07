# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  ## Choose your base box
      config.vm.box = "DebianVagrantBox"

      # Salt State Formulas
      config.vm.synced_folder "./provisioner", "/srv/salt"

      # Shared folder for data containers
      config.vm.synced_folder "./data", "/app"

      config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
      config.vm.network "public_network", ip: "192.168.1.50"

      # Provisioner - Salt
      config.vm.provision :salt do |salt|
        salt.minion_config = "./provisioner/config/minion.conf"
        salt.run_highstate = true
        salt.colorize = true
  end
end

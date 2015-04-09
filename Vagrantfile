# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  ## Choose your base box
      config.vm.box = "DebianVagrantBox"

      # Salt State Formulas
      config.vm.synced_folder "./provisioner", "/srv/salt"

      # Shared folder for data containers
      config.vm.synced_folder "./data", "/app"
      config.vm.synced_folder "./server/", "/server"

      # Comment the following line if not working on docker containers
      config.vm.synced_folder "./containers/", "/containers"

      config.vm.network "forwarded_port", guest: 80, host: 8000
      config.vm.network "forwarded_port", guest: 443, host: 44300
      config.vm.network "public_network", ip: "192.168.1.50"

      # Provisioner - Salt
      config.vm.provision :salt do |salt|
        salt.minion_config = "./provisioner/config/minion.conf"
        salt.run_highstate = true
        salt.colorize = true
  end
end

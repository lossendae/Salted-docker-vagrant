# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  ## Choose your base box
      config.vm.box = "DebianJessieBox"

      # Salt State Formulas
      config.vm.synced_folder "./provisioner", "/srv/salt"

      # Shared folder for data containers
      config.vm.synced_folder "./www", "/var/www", :create => true, :owner => "www-data", :group => "www-data"
      config.vm.synced_folder "./services/", "/app/services", :create => true, :owner => "www-data", :group => "www-data"

      # Comment the following line if not working on docker containers
      config.vm.synced_folder "./containers/", "/app/containers"

      config.vm.network "forwarded_port", guest: 80, host: 8000
      config.vm.network "forwarded_port", guest: 443, host: 44300

      # Edit following line for own case
      config.vm.network "public_network", ip: "192.168.2.90"

      # Provisioner - Salt
      config.vm.provision :salt do |salt|
        salt.minion_config = "./provisioner/config/minion.conf"
        salt.run_highstate = true
        salt.colorize = true
  end
end

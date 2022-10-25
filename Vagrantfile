Vagrant.configure("2") do |config|
    # Provisioning MongoDB
    config.vm.define "mongodb" do |mongo|
      mongo.vm.box = "generic/ubuntu2010"
      mongo.vm.network "private_network", ip: "192.168.56.20"
      mongo.vm.provider "virtualbox" do |vb|
        config.vm.synced_folder "env/", "/home/vagrant/env" 
      end
      mongo.vm.provision "shell", path: "env/mongodb/script.sh"
    end
  
    # Provisioning NodeJS App
    config.vm.define "nodeapp" do |nodeapp|
      nodeapp.vm.box = "generic/ubuntu2010"
      nodeapp.vm.network "private_network", ip: "192.168.56.10"
      nodeapp.hostsupdater.aliases = ["nology.training"]
      nodeapp.vm.provider "virtualbox" do |vb|
        nodeapp.vm.synced_folder "app/", "/home/vagrant/app/"
        nodeapp.vm.synced_folder "env/", "/home/vagrant/env"
      end
      nodeapp.vm.provision "shell", inline: "echo 'export DB_PATH=192.168.56.20' >> /etc/profile.d/myvars.sh", run: "always"
      nodeapp.vm.provision "shell", path: "env/nodeapp/script.sh"
    end
  end
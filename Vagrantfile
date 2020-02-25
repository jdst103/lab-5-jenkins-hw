# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  config.vm.define "slave" do |slave|
    slave.vm.box = "ubuntu/bionic64"
    slave.vm.network "private_network", ip: "192.168.10.110"
    slave.hostsupdater.aliases = ["development.local"]
    slave.vm.synced_folder "app", "/home/ubuntu/app"
    slave.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
  end

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
end

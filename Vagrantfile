Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.hostname = "meu-servidor"

  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provision "shell", path: "provision/provision.sh"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "hashicorp/bionic64"
    ansible.vm.box_version = "1.0.282"
    ansible.vm.hostname = "ansible001"
    ansible.vm.network "public_network", bridge: "Intel(R) Wi-Fi 6E AX211 160MHz", ip: "192.168.50.100"
    # Configure provider
    ansible.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "2048"
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
    end
    # Run a shell script
    ansible.vm.provision "shell", inline: <<-SHELL
    sudo ip route add default via 192.168.50.1
    SHELL
    ansible.vm.provision "shell", path: "./script.sh"
  end

    # Define the first client machine
  config.vm.define "client1" do |client1|
    client1.vm.box = "ubuntu/jammy64" #"geerlingguy/ubuntu2004"
    client1.vm.box_version = "20241002.0.0"
    client1.vm.hostname = "client1"
    client1.vm.network "public_network", bridge: "Intel(R) Wi-Fi 6E AX211 160MHz", ip: "192.168.50.101"
    client1.vm.provider "virtualbox" do |vb|
      vb.gui  = false
      vb.memory = "1024"
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
    end
    client1.vm.provision "shell", inline: <<-SHELL
    sudo ip route add default via 192.168.50.1
    cp /vagrant/sshkey/ansible_id_rsa.pub /home/vagrant/.ssh/authorized_keys &&  chmod 600 /home/vagrant/.ssh/authorized_keys
    echo Hello from Client1!
    SHELL
  end

    # Define the Second client machine
  config.vm.define "client2" do |client2|
    client2.vm.box = "ubuntu/jammy64" #"geerlingguy/ubuntu2004"
    client2.vm.box_version = "20241002.0.0"
    client2.vm.hostname = "client2"
    client2.vm.network "public_network", bridge: "Intel(R) Wi-Fi 6E AX211 160MHz", ip: "192.168.50.102"
    client2.vm.provider "virtualbox" do |vb|
      vb.gui  = false
      vb.memory = "512"
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
    end
    client2.vm.provision "shell", inline: <<-SHELL
    sudo ip route add default via 192.168.50.1
    cp /vagrant/sshkey/ansible_id_rsa.pub /home/vagrant/.ssh/authorized_keys &&  chmod 600 /home/vagrant/.ssh/authorized_keys
    echo Hello from Client2!
    SHELL
  
  end

end


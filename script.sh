# #! /bin/bash

# Install prerequisites and add Ansible PPA
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible (no extra update steps)
sudo apt install ansible -y

PUBLIC_KEY=$(cat /vagrant/sshkey/ansible_id_rsa.pub | tr -d '\n')
echo $PUBLIC_KEY >> /home/vagrant/.ssh/authorized_keys
cp /vagrant/sshkey/ansible_id_rsa /home/vagrant/.ssh/
sudo chown vagrant:vagrant /home/vagrant/.ssh/*
chmod 600 /home/vagrant/.ssh/authorized_keys /home/vagrant/.ssh/ansible_id_rsa

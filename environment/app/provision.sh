#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

sudo apt-get install nginx -y

# finally, restart the nginx service so the new config takes hold
sudo service nginx restart

#install java 8
# sudo apt install software-properties-common apt-transport-https -y
#
# sudo add-apt-repository ppa:openjdk-r/ppa -y
#
# sudo apt install openjdk-8-jdk -y

sudo apt install default-jre -y

echo 'export DB_HOST=mongodb://192.168.10.150:27017/posts' >> /home/vagrant/.bashrc

#copy own ssh public key to vm
sudo cat /vagrant/environment/app/jenkins_key.pub >> /home/vagrant/.ssh/authorized_keys

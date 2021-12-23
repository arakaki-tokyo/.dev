#!/bin/bash
HR1='-------------------------------------------------------------------------\n'
HR2='=========================================================================\n'
# Installation
echo -e '# Installation and Setup Docker!! \n'
## Set up the repository

echo -e $HR2 '## Set up the repository'
echo -e $HR2 
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo -e $HR1 '### Add Docker’s official GPG key'
echo -e $HR1
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo -e $HR1 '### Set up the stable repository'
echo -e $HR1
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


echo -e $HR2 '## Install Docker Engine'
echo -e $HR2
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo -e $HR2 '## Create docker network'
echo -e $HR2
docker network create --subnet=172.18.0.0/24 agora

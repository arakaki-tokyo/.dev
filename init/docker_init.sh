#!/bin/bash
p(){
  style=${2:-"4;31"}
  echo -e "\e[${style}m${1}\e[m"
}

echo -e '                                                  🐳🐳                                      '
echo -e '🐳🐳🐳🐳🐳🐳                                      🐳🐳                                      '
echo -e '🐳🐳      🐳🐳🐳                                  🐳🐳                                      '
echo -e '🐳🐳          🐳🐳                                🐳🐳                                      '
echo -e '🐳🐳          🐳🐳      🐳🐳🐳          🐳🐳🐳🐳  🐳🐳    🐳🐳      🐳🐳🐳      🐳    🐳🐳  '
echo -e '🐳🐳            🐳  🐳🐳🐳  🐳🐳🐳    🐳🐳    🐳  🐳🐳  🐳🐳    🐳🐳🐳  🐳🐳    🐳🐳🐳  🐳🐳'
echo -e '🐳🐳            🐳  🐳🐳      🐳🐳  🐳🐳          🐳🐳🐳🐳      🐳🐳      🐳🐳  🐳🐳      🐳'
echo -e '🐳🐳            🐳  🐳          🐳  🐳            🐳🐳🐳        🐳🐳🐳🐳🐳🐳🐳  🐳🐳        '
echo -e '🐳🐳          🐳🐳  🐳          🐳  🐳            🐳🐳🐳🐳      🐳🐳            🐳🐳        '
echo -e '🐳🐳          🐳🐳  🐳🐳      🐳🐳  🐳🐳          🐳🐳  🐳🐳    🐳🐳            🐳🐳        '
echo -e '🐳🐳      🐳🐳🐳    🐳🐳🐳  🐳🐳    🐳🐳🐳    🐳  🐳🐳    🐳🐳  🐳🐳🐳    🐳🐳  🐳🐳        '
echo -e '🐳🐳🐳🐳🐳🐳          🐳🐳🐳🐳          🐳🐳🐳🐳  🐳🐳      🐳🐳  🐳🐳🐳🐳🐳    🐳🐳        '

# Installation
p 'Installation and Setup Docker!!' "1;47;41"

p 'Set up the repository\n' 
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

p 'Add Docker’s official GPG key\n'
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

p 'Set up the stable repository\n'
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


p 'Install Docker Engine\n'
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Configration
p 'Docker configrations' "1;47;41"
p 'Create docker network\n'
docker network create --subnet=172.18.0.0/24 agora

#!/bin/bash
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo apt update -y
sudo apt install -y git


git clone https://gitlab.com/Askaredox/sa_tareaspracticas_201612272.git
cd /sa_tareaspracticas_201612272
sudo git checkout feature/tp_5
sudo docker-compose -f "docker-compose.yaml" up -d --build
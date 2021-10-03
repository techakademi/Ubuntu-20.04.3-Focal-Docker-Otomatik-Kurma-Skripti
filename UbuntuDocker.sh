#!/bin/bash

# Bu skript ile, Ubuntu işletim sistemine yeni Docker, Docker-Compose ve git'in son sürümün yükleme işlemini gerçekleştirebilirsiniz.

sudo apt -y update

sudo apt -y upgrade

sudo apt -y install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

apt-cache policy docker-ce

sudo apt install docker-ce

sudo usermod -aG docker ${USER}

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker run hello-world

sudo apt -y install git

git --version

git config --global user.name "Hamza GURCAN"

git config --global user.email "hamzagurcan@gmail.com"

git config --list
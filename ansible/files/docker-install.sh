#!/bin/bash

# Fix apt packages
sudo apt autoremove && sudo apt autoclean -y

# Uninstall old versions
sudo apt-get remove -y docker docker-engine docker.io containerd runc

# Updating packages
sudo apt-get update

# Adding required packages
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adding to the key repo list
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Updating packages and Installing docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io 
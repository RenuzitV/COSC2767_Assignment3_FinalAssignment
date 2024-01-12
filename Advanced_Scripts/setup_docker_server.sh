#!/bin/bash
# Setup Docker Server on Amazon Linux 2

# Update the system
sudo yum update -y

# Install Docker
sudo yum install -y docker

# Start Docker service
sudo service docker start

# Clone the RMIT Store repository
git clone https://github.com/TomHuynhSG/cosc2767-rmit-store.git

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
docker-compose version

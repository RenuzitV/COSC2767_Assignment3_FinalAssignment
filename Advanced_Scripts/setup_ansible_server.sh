#!/bin/bash
# Setup Ansible Server on Amazon Linux 2

# Update the system
sudo yum update -y

# Change hostname to ansible_server
sudo hostnamectl set-hostname ansible_server

# Create ansibleadmin user and set password
sudo useradd ansibleadmin
echo "ansibleadmin:ansibleadmin" | sudo chpasswd

# Enable Password Authentication
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl reload sshd

# Generate SSH keys for ansibleadmin user
sudo -u ansibleadmin ssh-keygen -t rsa -N '' -f /home/ansibleadmin/.ssh/id_rsa

# Install Ansible
sudo amazon-linux-extras install ansible2 -y

# Verify Ansible installation
ansible --version
#!/bin/bash

# Become the root user
sudo su -

# Set the hostname
echo "ansible_server" > /etc/hostname

# Reboot the system to apply hostname change
reboot

# After reboot, log back in and continue with the script

# Create the ansibleadmin user with a predefined password
useradd ansibleadmin
echo "ansibleadmin:ansibleadmin" | chpasswd

# Grant ansibleadmin user passwordless sudo privileges
echo "ansibleadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Enable password authentication for SSH
sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
service sshd reload

# Switch to the ansibleadmin user
su - ansibleadmin

# Generate an SSH key pair for ansibleadmin
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

# Install Ansible
amazon-linux-extras install ansible2 -y

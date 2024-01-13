#!/bin/bash
# Setup Jenkins Server on Amazon Linux 2

# Update the system
sudo yum update -y

# Install Java (required for Jenkins)
sudo yum install java-1.8.0-openjdk-devel -y

# Add Jenkins repository and install Jenkins
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y

# Start Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins
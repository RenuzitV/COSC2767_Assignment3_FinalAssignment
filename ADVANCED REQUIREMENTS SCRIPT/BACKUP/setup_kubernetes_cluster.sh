#!/bin/bash
# Setup Kubernetes Cluster on AWS EKS

# Install AWS CLI, eksctl, and kubectl
sudo yum install -y aws-cli
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.3/2023-11-14/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin and cp ./kubectl $HOME/bin/kubectl and export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

# Create an EKS cluster
eksctl create cluster --name devops-eks-cluster --region us-east-1 --nodegroup-name standard-workers --node-type t2.micro --nodes 3 --nodes-min 1 --nodes-max 4 --node-ami auto --version 1.28

# Verify kubectl installation
kubectl version --client
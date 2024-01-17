#!/bin/bash

# Update kubeconfig
aws eks update-kubeconfig --name devops-eks-cluster --region us-east-1

# Execute the passed command (if any)
exec "$@"
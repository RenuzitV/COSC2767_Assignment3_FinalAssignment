#!/bin/bash
#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2022B
#   Assessment: Assignment 3
#   Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
#   Created  date: NaN
#   Last modified: 25/01/2024
#   Acknowledgement: 

# Update kubeconfig
aws eks update-kubeconfig --name devops-eks-cluster --region us-east-1

# Execute the passed command (if any)
if [ $# -eq 0 ]; then
    exec /usr/local/bin/jenkins.sh
else
    exec "$@"
fi
#!/bin/bash
# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2022B
# Assessment: Assignment 3
# Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
# Created date: NaN
# Last modified: 25/01/2024
# Acknowledgement:

# Install Prometheus
sudo yum install prometheus

# Start Prometheus
sudo systemctl start prometheus
sudo systemctl enable prometheus

# Verify Prometheus status
sudo systemctl status prometheus

# Install Grafana
sudo yum install grafana

# Start Grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Verify Grafana status
sudo systemctl status grafana-server

# Note: Access Grafana UI at http://<EC2-Instance-IP>:3000

#!/bin/bash

# Set variables
INSTANCE_TYPE="t2.micro"
AMI_ID="ami-0c55b159cbfafe1f0" # Update this with the latest Amazon Linux 2 AMI ID
KEY_NAME="your-key-pair" # Specify your key pair name
SECURITY_GROUP="your-security-group-id" # Specify your security group ID
SUBNET_ID="your-subnet-id" # Specify your subnet ID

# Step 1: Create an AWS EC2 Instance
echo "Creating AWS EC2 Instance..."
INSTANCE_ID=$(aws ec2 run-instances --image-id $AMI_ID --count 1 --instance-type $INSTANCE_TYPE --key-name $KEY_NAME --security-group-ids $SECURITY_GROUP --subnet-id $SUBNET_ID --query 'Instances[0].InstanceId' --output text)
echo "Instance ID: $INSTANCE_ID"

# Wait for the instance to be in running state
echo "Waiting for instance to be in 'running' state..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

# Get Public IP of the instance
PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
echo "Instance Public IP: $PUBLIC_IP"

# Step 2: Install Prometheus
echo "Installing Prometheus..."
ssh -o "StrictHostKeyChecking=no" -i /path/to/$KEY_NAME.pem ec2-user@$PUBLIC_IP << 'EOF'
  sudo yum update -y
  sudo yum install -y wget
  wget https://github.com/prometheus/prometheus/releases/download/v2.27.1/prometheus-2.27.1.linux-amd64.tar.gz
  tar -xvf prometheus-2.27.1.linux-amd64.tar.gz
  cd prometheus-2.27.1.linux-amd64
  ./prometheus --config.file=prometheus.yml &
EOF

# Step 3: Install Grafana
echo "Installing Grafana..."
ssh -i /path/to/$KEY_NAME.pem ec2-user@$PUBLIC_IP << 'EOF'
  sudo yum install -y grafana
  sudo systemctl enable grafana-server
  sudo systemctl start grafana-server
EOF

# Step 4 (Optional): Install ELK Stack
echo "Installing ELK Stack (Optional)..."
ssh -i /path/to/$KEY_NAME.pem ec2-user@$PUBLIC_IP << 'EOF'
  # Install Elasticsearch
  sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
  sudo yum install -y elasticsearch
  sudo systemctl enable elasticsearch.service
  sudo systemctl start elasticsearch.service

  # Install Logstash
  sudo yum install -y logstash
  sudo systemctl enable logstash.service
  sudo systemctl start logstash.service

  # Install Kibana
  sudo yum install -y kibana
  sudo systemctl enable kibana.service
  sudo systemctl start kibana.service
EOF

echo "Monitoring setup completed. Access Grafana at http://$PUBLIC_IP:3000/"
# Instructions for Running the Script
`chmod +x setup_monitoring.sh`
`./setup_monitoring.sh`

# Important Notes
* Replace the placeholder values (AMI_ID, KEY_NAME, SECURITY_GROUP, SUBNET_ID) with EC2 INSTANCE specific details.

* The script assumes AWS CLI is installed and configured with the necessary permissions.

* The ELK stack installation is optional and can be commented out if not needed.

* Ensure the security group associated with the EC2 instance allows inbound traffic on ports 3000 (Grafana), 9200 (Elasticsearch), 5601 (Kibana), and 9090 (Prometheus).

* After the setup, you might need to manually configure Grafana to connect to Prometheus and set up dashboards.
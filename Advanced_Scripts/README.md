# Execution Steps

* Run the Ansible Server Setup
  
* Execute `setup_ansible_server.sh` on the EC2 instance designated as the Ansible server.

* Run the Docker Server Setup Script: Execute `setup_docker_server.sh` on the EC2 instance designated as the Docker server.

* Run the Jenkins Server Setup Script: Execute `setup_jenkins_server.sh` on the EC2 instance designated as the Jenkins server.

* Run the Kubernetes Cluster Setup Script: Execute `setup_kubernetes_cluster.sh` on an EC2 instance to set up the Kubernetes cluster using AWS EKS.

* Configure Jenkins CI/CD Pipeline: Set up a Jenkins job to execute the Ansible playbooks for building and deploying the application.

* Deploy the Application: Run the Jenkins job to build the Docker image, push it to DockerHub, and deploy it using the Ansible playbooks.

* These scripts and playbooks are tailored to follow the instructions from documents.

# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2022B
# Assessment: Assignment 3
# Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
# Created date: NaN
# Last modified: 25/01/2024
# Acknowledgement:

# Update the system
yum update -y

# Install Docker
yum install -y docker

# Start Docker service
service docker start

# Enable Docker service to start on boot
systemctl enable docker

# For the master node
if [ "$1" == "master" ]; then
    # Initialize Docker Swarm (only on master)
    docker swarm init

    # The output will include a docker swarm join command with a token
    # Copy that command and run it on the worker nodes to join them to the swarm
fi

# For the worker nodes
if [ "$1" == "worker" ]; then
    # Join the swarm using the token provided by the master node
    # The command below should be replaced with the actual command provided by the master node
    # Example: docker swarm join --token SWMTKN-1-xxxxx 192.168.65.3:2377
    echo "Join the swarm using the command provided by the master node"
fi

# Set the hostname
echo "docker_server" > /etc/hostname

# Inform the user to run the post-reboot script after the server restarts
echo "Rebooting....."

# Reboot the server
reboot
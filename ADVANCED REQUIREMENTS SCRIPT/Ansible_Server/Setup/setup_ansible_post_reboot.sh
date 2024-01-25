# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2022B
# Assessment: Assignment 3
# Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
# Created date: NaN
# Last modified: 25/01/2024
# Acknowledgement:
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
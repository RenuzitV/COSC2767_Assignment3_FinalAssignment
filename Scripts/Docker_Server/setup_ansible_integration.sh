# Variables
DOCKER_SERVER_IP="54.81.116.166"
JENKINS_SERVER_IP="18.207.200.244"
ANSIBLE_USER="ansibleadmin"
ANSIBLE_PLAYBOOK_PATH="path/to/your/playbook.yml"

# Step 1: Create ansibleadmin user on Docker Server
ssh $DOCKER_SERVER_IP "sudo adduser $ANSIBLE_USER; sudo passwd $ANSIBLE_USER; echo '$ANSIBLE_USER ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers"

# Step 2: Update Ansible Inventory on Ansible Server
echo -e "[docker]\ndocker_server ansible_host=$DOCKER_SERVER_IP ansible_user=$ANSIBLE_USER" >> /etc/ansible/hosts

# Step 3: Test Ansible to Docker Server Connection
ansible docker -m ping

# Step 4: Jenkins Configuration (Placeholder for manual steps)
echo "Please configure Jenkins manually to use Ansible for deployment tasks and to communicate with the Ansible server."

# Step 5: Jenkins Job Configuration (Placeholder for manual steps)
echo "Modify Jenkins job to include the following script for deploying using Ansible playbook:"
echo "ansiblePlaybook playbook: '$ANSIBLE_PLAYBOOK_PATH'"

# Reminder for manual steps
echo "Remember to manually configure Jenkins and place the Ansible playbooks in an accessible location."



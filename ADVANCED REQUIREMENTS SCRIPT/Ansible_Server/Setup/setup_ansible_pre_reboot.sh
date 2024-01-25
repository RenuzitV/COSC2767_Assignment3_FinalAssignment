#!/bin/bash
# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2022B
# Assessment: Assignment 3
# Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
# Created date: NaN
# Last modified: 25/01/2024
# Acknowledgement:

# Set the hostname
echo "ansible_server" > /etc/hostname

# Inform the user to run the post-reboot script after the server restarts
echo "Please run 'setup_ansible_post_reboot.sh' after the server restarts."

# Reboot the server
reboot
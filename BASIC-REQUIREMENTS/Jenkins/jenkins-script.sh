#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2022B
#   Assessment: Assignment 3
#   Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
#   Created  date: NaN
#   Last modified: 25/01/2024
#   Acknowledgement: JENKINS_REPO_URI=3750945/jenkins

docker kill jenkins

docker rm jenkins

docker run -d -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --name jenkins --restart always $JENKINS_REPO_URI:latest
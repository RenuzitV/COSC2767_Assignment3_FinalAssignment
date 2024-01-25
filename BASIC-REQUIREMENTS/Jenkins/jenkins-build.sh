#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2022B
#   Assessment: Assignment 3
#   Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
#   Created  date: NaN
#   Last modified: 25/01/2024
#   Acknowledgement: 
JENKINS_REPO_URI=3750945/jenkins

echo "040421Ed!" | docker login --username 3750945 --password-stdin

docker build --build-arg DOCKER_GROUP_ID=$(getent group docker | cut -d: -f3) -t jenkins .

docker tag jenkins:latest $JENKINS_REPO_URI:latest

docker push $JENKINS_REPO_URI:latest

yes | docker image prune -a

yes | docker volume prune -a

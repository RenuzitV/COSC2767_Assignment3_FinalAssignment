JENKINS_REPO_URI=959445117732.dkr.ecr.us-east-1.amazonaws.com/jenkins

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $JENKINS_REPO_URI

docker build -t jenkins .

docker tag jenkins:latest $JENKINS_REPO_URI:latest

docker push $JENKINS_REPO_URI:latest
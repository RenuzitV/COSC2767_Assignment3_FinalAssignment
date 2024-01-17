aws eks update-kubeconfig --name devops-eks-cluster --region us-east-1

yum install docker -y

systemctl enable docker

systemctl start docker

cd Jenkins

chmod +x jenkins-build.sh

./jenkins-build.sh

chmod +x jenkins-script.sh

./jenkins-script.sh


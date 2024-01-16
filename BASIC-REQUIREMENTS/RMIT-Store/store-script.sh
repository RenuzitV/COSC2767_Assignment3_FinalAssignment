# if we want to test the network connection on a docker container

ECR_REPO_URI=959445117732.dkr.ecr.us-east-1.amazonaws.com/rmitstore

docker kill rmitstore

docker rm rmitstore

docker run -d -p 80:80 --name rmitstore --network test_network $ECR_REPO_URI:latest
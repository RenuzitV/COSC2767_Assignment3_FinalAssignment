ECR_REPO_URI=959445117732.dkr.ecr.us-east-1.amazonaws.com/rmitstore

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REPO_URI

git clone https://github.com/RenuzitV/COSC2767-RMIT-Store.git

cd COSC2767-RMIT-Store

docker build -t rmitstore .

docker tag rmitstore:latest $ECR_REPO_URI

docker push $ECR_REPO_UR

docker kill rmitstore

docker rm rmitstore

docker run -d -p 80:80 --name rmitstore rmitstore:latest
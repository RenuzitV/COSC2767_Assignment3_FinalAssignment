DB_REPO_URI=959445117732.dkr.ecr.us-east-1.amazonaws.com/mariadb

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $DB_REPO_URI

docker build -t mariadb .

docker tag mariadb:latest $DB_REPO_URI:latest

docker push $DB_REPO_URI:latest
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 959445117732.dkr.ecr.us-east-1.amazonaws.com/mariadb

docker build -t mariadb .

docker tag mariadb:latest 959445117732.dkr.ecr.us-east-1.amazonaws.com/mariadb:latest

docker push 959445117732.dkr.ecr.us-east-1.amazonaws.com/mariadb:latest

docker kill mariadb

docker rm mariadb

docker run --name mariadb -v /path/to/init-db.sql:/docker-entrypoint-initdb.d/init-db.sql -p 3306:3306 -d mariadb

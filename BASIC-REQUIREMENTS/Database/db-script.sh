# if we want to test the network connection on a docker container, uncomment the below lines
DB_REPO_URI=959445117732.dkr.ecr.us-east-1.amazonaws.com/mariadb

docker kill mariadb

docker rm mariadb

docker run --name mariadb -p 3306:3306 -d --network test_network $DB_REPO_URI:latest

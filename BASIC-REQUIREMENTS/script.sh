# if we want to test the network connection on a docker container
# docker network create --driver bridge test_network


cd Database

chmod +x db-script.sh

./db-script.sh

cd ..

cd RMIT-Store

chmod +x store-script.sh

./store-script.sh

cd ..

cd Kubernetes

kubectl delete all --all --namespace=default

kubectl create -f mariadb-deploy.yml
kubectl create -f mariadb-service.yml
kubectl create -f rmit-store-deploy.yml
kubectl create -f rmit-store-service.yml


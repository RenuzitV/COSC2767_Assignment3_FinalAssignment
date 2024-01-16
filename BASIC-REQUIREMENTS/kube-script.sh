# if we want to test the network connection on a docker container
# docker network create --driver bridge test_networ
# https://github.com/kubernetes/kubernetes/issues/13488
cd Kubernetes

kubectl delete all --all --namespace=default

kubectl create -f mariadb-deploy.yml
kubectl create -f mariadb-service.yml
kubectl create -f rmit-store-deploy.yml
kubectl create -f rmit-store-service.yml


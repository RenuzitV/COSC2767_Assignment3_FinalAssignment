cd RMIT-Store

chmod +x db-script.sh

./db-script.sh

chmod +x store-script.sh

./store-script.sh

cd ../Kubernetes

kubectl delete all --all --namespace=default

kubectl create -f mariadb-deploy.yml
kubectl create -f mariadb-service.yml
kubectl create -f rmit-store-deploy.yml
kubectl create -f rmit-store-service.yml
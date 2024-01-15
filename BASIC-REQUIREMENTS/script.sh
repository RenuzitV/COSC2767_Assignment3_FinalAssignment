chmod +x Database/db-script.sh

./Database/db-script.sh

chmod +x RMIT-Store/store-script.sh

./RMIT-Store/store-script.sh

cd Kubernetes

kubectl delete all --all --namespace=default

kubectl create -f mariadb-deploy.yml
kubectl create -f mariadb-service.yml
kubectl create -f rmit-store-deploy.yml
kubectl create -f rmit-store-service.yml
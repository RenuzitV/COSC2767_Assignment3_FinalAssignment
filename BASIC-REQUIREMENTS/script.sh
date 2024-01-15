cd Kubernetes

kubectl delete all --all --namespace=default

kubectl create -f mariadb-pod.yml
kubectl create -f mariadb-service.yml
kubectl create -f rmit-store-pod.yml
kubectl create -f rmit-store-service.yml
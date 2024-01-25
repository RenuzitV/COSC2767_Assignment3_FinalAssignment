# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2022B
# Assessment: Assignment 3
# Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
# Created date: NaN
# Last modified: 25/01/2024
# Acknowledgement:
# https://docs.aws.amazon.com/eks/latest/userguide/prometheus.html
# https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/

# install helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

kubectl create namespace prometheus

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm upgrade -i prometheus prometheus-community/prometheus \
    --namespace prometheus \
    --set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"

kubectl apply -f prometheus-load-balancer.yml

# dunno if this is needed
# kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
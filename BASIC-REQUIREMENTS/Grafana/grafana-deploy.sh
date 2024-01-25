#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2022B
#   Assessment: Assignment 3
#   Author: Trieu Hoang Khang – s3878466, Nguyen Vu Minh Duy – s3878076, Thai Manh Phi – s3878070, Kha Nguyen Anh Tran – s3750945, Nguyen Phuc Cuong – s3881006
#   Created  date: NaN
#   Last modified: 25/01/2024
#   Acknowledgement: 
# https://awstip.com/eks-monitoring-using-prometheus-and-grafana-dashboard-edb1b53e0fd6

helm repo add grafana https://grafana.github.io/helm-charts 
helm repo update

kubectl create namespace grafana

helm upgrade grafana grafana/grafana \
    --namespace grafana \
    --set persistence.storageClassName="gp2" \
    --set persistence.enabled=true \
    --set adminPassword='admin' \
    --values prometheus-datasource.yml \
    --set service.type=LoadBalancer
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
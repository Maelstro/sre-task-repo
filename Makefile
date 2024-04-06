.PHONY: start-cluster
start-cluster:
	minikube start
	kubectl create namespace sre

.PHONY: add-repos
add-repos:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo update

.PHONY: install-prometheus
install-prometheus:
	envsubst < alert-targets.yml > alert-targets.filled.yml
	helm upgrade --install prometheus prometheus-community/prometheus -n sre -f prometheus.yml -f alert-targets.filled.yml
	rm alert-targets.filled.yml

.PHONY: install-grafana
install-grafana:
	helm upgrade --install grafana grafana/grafana --namespace sre --set adminPassword="admin"

.PHONY: start-upcommerce
start-upcommerce:
	kubectl apply -f deployment.yml -f service.yml -n sre
	
.PHONY: expose-upcommerce
expose-upcommerce:
	minikube service upcommerce-service -n sre

.PHONY: stop-all
stop-all:
	minikube stop
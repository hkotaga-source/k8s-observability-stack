# Kubernetes Observability Stack (SRE / DevOps)

Production-ready monitoring stack for Kubernetes using **Prometheus + Grafana + Alertmanager**.

## What's Included

- Terraform to provision basic AWS EKS (or use existing cluster)
- Helm charts for Prometheus Operator
- Pre-configured Grafana dashboards (Kubernetes, Node, Application)
- Alertmanager routes to Slack / PagerDuty
- ServiceMonitors for common applications
- Recording rules & Alerting rules focused on SRE SLIs/SLOs

## Quick Start

```bash
# 1. Deploy the monitoring stack
cd helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
  -f values.yaml \
  -n monitoring --create-namespace

# 2. Access Grafana
kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring
# Default login: admin / prom-operator
```

## Structure

```
├── terraform/          # Optional EKS + node groups
├── helm/               # Custom values for kube-prometheus-stack
├── manifests/          # Extra ServiceMonitors, PrometheusRules
└── docs/               # Runbooks linked to alerts
```

## SRE Focus

- Golden signals (Latency, Traffic, Errors, Saturation)
- SLO-based alerts (error budget burn rate)
- Multi-window multi-burn-rate alerts
- Dashboard-as-code

## Author

Created for SRE/DevOps portfolio – https://github.com/hkotaga-source

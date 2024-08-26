# Ping Personal Website

## Description

- Personal Website Repository Used For Kubernetes Deployment

## Requirements

- Kubernetes
- Django
- Postgres
- Redis
- Nginx (for Django Static Files)
- Nginx Ingress
- Kubernetes Dashboard (Optional)

## Prerequisites

### Nginx Ingress

- Installation
  ```bash
  helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
  ```

### kubernetes-dashboard

- [Kubernetes DashBoard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/) (Optional)
    - Installation
  ```bash
  # Add kubernetes-dashboard repository
  helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
  # Deploy a Helm Release named "kubernetes-dashboard" using the kubernetes-dashboard chart
  helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
  ```
    - Simple Way
        - `kubectl apply -f ./dashboard/`
    - Details
        - Create Service Account
          ```bash
          kubectl create serviceaccount admin-user -n kubernetes-dashboard
          ```
        - Create ClusterRoleBinding
          ```bash
          kubectl create clusterrolebinding admin-user --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:admin-user
          ```
    - Start
        - Get Token
          ```bash
          kubectl -n kubernetes-dashboard create token admin-user
          ```
        - Port Forward
          ```bash
          kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
          ```
        - Access Dashboard
          ```bash
          https://localhost:8443
          ```


## Deploying the application

- `helm upgrade --install django-k8s django-k8s/ --namespace ping-web-ns --create-namespace`


## Remove

- `helm uninstall django-k8s --namespace ping-web-ns`


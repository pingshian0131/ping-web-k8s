#!/bin/bash

# kubernetes-dashboard
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

# ingress-nginx
helm upgrade --install ingress-nginx ingress-nginx \
--repo https://kubernetes.github.io/ingress-nginx \
--namespace ingress-nginx --create-namespace

# cert-manager
helm repo add jetstack https://charts.jetstack.io --force-update
helm install cert-manager jetstack/cert-manager \
--namespace cert-manager --create-namespace \
--version v1.15.3 \
--set crds.enabled=true --set prometheus.enabled=false \
--set webhook.timeoutSeconds=4

# ping-web
helm upgrade --install django-k8s ./django-k8s \
--namespace ping-web-ns --create-namespace

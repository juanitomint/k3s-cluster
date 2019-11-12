#!/bin/sh
helm install \
--set enableInsecureLogin=true,enableSkipLogin=true,rbac.clusterAdminRole=true,ingress.enabled=true \
--name kubernetes-dashboard \
--namespace kubernetes-dashboard \
--wait --timeout=90 \
stable/kubernetes-dashboard

POD_NAME=$(kubectl get pods -n kubernetes-dashboard -l "app=kubernetes-dashboard,release=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
echo http://127.0.0.1:9000/
kubectl -n kubernetes-dashboard port-forward $POD_NAME 9000:9090
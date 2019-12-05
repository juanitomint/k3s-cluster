#!/bin/sh
# --set enableInsecureLogin=true,enableSkipLogin=true,rbac.clusterAdminRole=true,ingress.enabled=true \
helm delete --purge kubernetes-dashboard
helm install \
--name kubernetes-dashboard \
--namespace kubernetes-dashboard \
--wait --timeout=90 \
-f dashboard-values.yaml \
stable/kubernetes-dashboard

# POD_NAME=$(kubectl get pods -n kubernetes-dashboard -l "app=kubernetes-dashboard,release=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
 echo http://localhost/dashboard/
# kubectl -n kubernetes-dashboard port-forward $POD_NAME 9000:9090
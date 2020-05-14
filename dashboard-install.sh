#!/bin/sh

# check helm version
if [ ! "$(helm version --short|cut -c1-2)" = "v3" ]; then
echo "Error this script needs Helm v3"
exit 1
fi
# --set enableInsecureLogin=true,enableSkipLogin=true,rbac.clusterAdminRole=true,ingress.enabled=true \
kubectl create namespace kubernetes-dashboard 2>/dev/null
helm install \
--namespace kubernetes-dashboard \
--wait --timeout=90s \
-f dashboard-values.yaml \
kubernetes-dashboard \
stable/kubernetes-dashboard

# POD_NAME=$(kubectl get pods -n kubernetes-dashboard -l "app=kubernetes-dashboard,release=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
 echo http://localhost/dashboard/
# kubectl -n kubernetes-dashboard port-forward $POD_NAME 9000:9090
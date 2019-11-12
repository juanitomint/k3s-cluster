#!/bin/bash
NODES=$(kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="InternalIP")].address }')

cat traefik_config/dynamic_conf.tmpl > traefik_config/dynamic_conf.toml
# IFS=" "
template=$(cat traefik_config/dynamic_hosts.tmpl)
echo "template:"
echo "$template"
echo -e "found this nodes:"
for node in ${NODES} ; do
echo $node
url="http://$node"
echo "url: $url" 
echo "${template//nodeurl/$url}" >> traefik_config/dynamic_conf.toml
done
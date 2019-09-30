#!/bin/bash
NODES=$(kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="InternalIP")].address }')

echo -e "found this nodes:"
for node in ${NODES} ; do
echo $node
done
#!/bin/bash
if [ "$0" = "$BASH_SOURCE" ]; then
    echo "Error: Script must be run with source:"
    echo "source ./start-cluster.sh"
    exit 1
fi
echo -e "\nloading profile in KUBECONFIG AS: default"
export KUBECONFIG=$(pwd)/kubeconfig.yaml 

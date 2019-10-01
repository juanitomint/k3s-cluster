#!/bin/bash
if [ "$0" = "$BASH_SOURCE" ]; then
    echo "Error: Script must be run with source:"
    echo "source ./start-cluster ./start-cluster.sh"
    exit 1
fi
echo "starting server: docker-compose up -d"
docker-compose up -d --remove-orphans
echo -e "\nloading profile in KUBECONFIG AS: default"
export KUBECONFIG=$(pwd)/kubeconfig.yaml 

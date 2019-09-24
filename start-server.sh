#!/bin/bash
if [ "$0" = "$BASH_SOURCE" ]; then
    echo "Error: Script must be run with source:"
    echo "source ./start-cluster ./start-server.sh"
    exit 1
fi
echo "starting server: docker-compose up -d server"
docker-compose up -d server
echo -e "\nloading profile in KUBECONFIG AS: default"
export KUBECONFIG=$(pwd)/kubeconfig.yaml 

echo -e "\n\nFor start the workers nodes type:"
echo "docker compose up -d"
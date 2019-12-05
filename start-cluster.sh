#!/bin/bash
if [ "$0" = "$BASH_SOURCE" ]; then
    echo "Error: Script must be run with source:"
    echo "source ./start-cluster.sh"
    exit 1
fi    

# set scale
SCALE=4

if [ "$1" ]; then 
SCALE=$1
fi


echo "SCALE: $SCALE"
echo "starting server: docker-compose up -d"
docker-compose up -d --remove-orphans --scale worker_node=$SCALE
echo -e "\nloading profile in KUBECONFIG AS: default"
export KUBECONFIG=$KUBECONFIG:$(pwd)/kubeconfig.yaml 

docker-compose ps

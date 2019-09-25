#!/bin/bash
git clone https://github.com/rancher/local-path-provisioner.git
helm install --set storageClass.defaultClass=true --name local-path-storage --namespace local-path-storage local-path-provisioner/deploy/chart/
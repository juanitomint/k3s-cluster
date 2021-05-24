#!/bin/bash
git clone https://github.com/rancher/local-path-provisioner.git 2>/dev/null
helm install --set storageClass.defaultClass=true --namespace local-path-storage local-path-storage local-path-provisioner/deploy/chart/
# Kubernetes Cluster with docker-compose

you can run a local kubernetes cluster with a master and 4 nodes

Based on the great [K3s](https://k3s.io/) Lightweight Kubernetes image 

Made with love by Rancher Labs

## Configuration

none!

## USAGE

Start the master and set $KUBECONFIG for you
```
source start-server.sh
```
Now you can use *kubectl* as in any other kubernetes cluster
```
kubectl cluster-infoKubernetes master is running at https://localhost:6443
CoreDNS is running at https://localhost:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

now you can start the workers and got set $KUBECONFIG for you
```
source start-cluster.sh
```
```
kubectl get nodes -o=wide
NAME           STATUS   ROLES    AGE   VERSION         INTERNAL-IP   EXTERNAL-IP   OS-IMAGE   KERNEL-VERSION     CONTAINER-RUNTIME
000b0cd4c33c   Ready    <none>   4s    v1.14.1-k3s.4   172.18.0.3    <none>        Unknown    5.0.0-29-generic   containerd://1.2.5+unknown
5fb8e7e12350   Ready    <none>   3s    v1.14.1-k3s.4   172.18.0.6    <none>        Unknown    5.0.0-29-generic   containerd://1.2.5+unknown
6104a7e316b9   Ready    <none>   3s    v1.14.1-k3s.4   172.18.0.4    <none>        Unknown    5.0.0-29-generic   containerd://1.2.5+unknown
b769f581a748   Ready    <none>   4s    v1.14.1-k3s.4   172.18.0.5    <none>        Unknown    5.0.0-29-generic   containerd://1.2.5+unknown
```
To install [Helm](https://helm.sh/) (the package manager for kubernetes)
```
 ./helm-install.sh 
serviceaccount/tiller created
clusterrolebinding.rbac.authorization.k8s.io/tiller created
$HELM_HOME has been configured at /home/juanb/.helm.
Warning: Tiller is already installed in the cluster.
(Use --client-only to suppress this message, or --upgrade to upgrade Tiller to the current version.)
Happy Helming!
```

## if you want persistent storage in your nodes

 ```
 ./storage-install.sh
 ```


Then you can start a echo test Application

```
 ./echo-install.sh 
deployment.apps/echo created
service/echo-service created
ingress.networking.k8s.io/echo-ingress created
```
Then you can open http://localhost:8081/echo


### If you want to start it all over again then:
```
./remove-cluster.sh
```

have fun!

## Requirements

* Docker & docker-compose installed
* kubectl
* internet access

optionals:

* helm
* kubectx
* kubens
* k9s
* stern

## Features
2 stages
```
source ./start-server.sh
```
see your master come up! then

```
source ./start-cluster.sh
```
will start the worker-nodes


get token:  get a fresh token from registry

publish



## Author

- 2019 - now    : [Borda Juan Ignacio](https://github.com/juanitomint)

## License

This code is distributed under the MIT license, see the [LICENSE](LICENSE) file.

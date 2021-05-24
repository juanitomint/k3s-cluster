# Kubernetes Cluster with docker-compose

you can run a local kubernetes cluster with a master and 4 nodes

Based on the great [K3s](https://k3s.io/) Lightweight Kubernetes image 

Made with love by Rancher Labs

## Configuration

none!

## USAGE

Start the master and set $KUBECONFIG for you
```
source start-cluster.sh
```
by default it will spawn 4 nodes
if you want any other number let say 8
```
source start-cluster.sh 8
```
you can use the command above to size up or down the nodes

you'll get something like this at start-up

```
$ source ./start-cluster.sh 
SCALE: 4
starting server....
Building with native build. Learn about native build in Compose here: https://docs.docker.com/go/compose-native-build/
Recreating k3s_server_1 ... done
Recreating k3s_agent_1  ... done
Recreating k3s_agent_2  ... done
Recreating k3s_agent_3  ... done
Recreating k3s_agent_4  ... done

loading profile in KUBECONFIG AS: default
K3S_TOKEN=86731535528966
    Name           Command       State                    Ports                  
---------------------------------------------------------------------------------
k3s_agent_1    /bin/k3s agent    Up                                              
k3s_agent_2    /bin/k3s agent    Up                                              
k3s_agent_3    /bin/k3s agent    Up                                              
k3s_agent_4    /bin/k3s agent    Up                                              
k3s_server_1   /bin/k3s server   Up      0.0.0.0:6443->6443/tcp,:::6443->6443/tcp
```


Now you can use *kubectl* as in any other kubernetes cluster
```
 $ kubectl cluster-info
Kubernetes control plane is running at https://127.0.0.1:6443
CoreDNS is running at https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
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
Then you can open http://localhost/echo


### If you want to start it all over again then:
```
./remove-cluster.sh
```

### install kubernetes dashboard
```
./dashboard-install.sh
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

# K3s Cluster with docker-compose

you can run a local kubernetes cluster with a master and 4 nodes

Based on the great [K3s](https://k3s.io/) Lightweight Kubernetes image 

Made with love by Rancher Labs

## Configuration

none!

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

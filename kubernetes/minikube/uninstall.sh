#!/bin/bash

# set -e
set -x

minikube stop
minikube delete

sudo systemctl stop kubelet
sudo docker stop $(docker ps -aq) -f
sudo docker rm $(docker ps -aq) -f
sudo docker rmi $(docker images -aq) -f
sudo docker system prune -af --volumes

sudo rm -rf ~/.kube ~/.minikube
sudo rm -rf /root/.kube /root/.minikube
sudo rm -rf /var/lib/localkube
sudo rm -rf /usr/local/bin/localkube /usr/local/bin/minikube /usr/bin/minikube
sudo rm -rf /etc/kubernetes/
sudo rm -rf /usr/bin/kubeadm /usr/bin/kubelet /usr/bin/kubectl

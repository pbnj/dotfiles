#!/bin/bash

set -e
set -x

kubeadm init --pod-network-cidr=10.244.0.0/16

## To make kubectl usable by non-root users
mkdir -p "$HOME/.kube"
sudo cp -i /etc/kubernetes/admin.conf "$HOME/.kube/config"
sudo chown $(id -u):$(id -g) "$HOME/.kube/config"

## To make kubernetes schedule containers on master-node (such as the case for single-node kubernetes cluster deployments, for development only)
kubectl taint nodes --all node-role.kubernetes.io/master-

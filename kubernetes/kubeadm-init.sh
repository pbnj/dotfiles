#!/bin/bash

# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/

set -e
set -x

## Step 0: Prereqs
swapoff -a

## Step 1: check if we have connectivity with gcr.io registries. If not, this script will error out.
kubeadm config images pull

## Step 2: initialize master with "canal" networking
kubeadm init --pod-network-cidr=10.244.0.0/16

## Step 2a: make kubectl usable by non-root users
mkdir -p "$HOME/.kube"
sudo cp -i /etc/kubernetes/admin.conf "$HOME/.kube/config"
sudo chown $(id -u):$(id -g) "$HOME/.kube/config"

## Step 2b: apply "canal" configurations
kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/canal/canal.yaml

## [OPTIONAL] Step 3: make kubernetes schedule containers on master-node (such as the case for single-node kubernetes cluster deployments, FOR DEVELOPMENT ONLY)
kubectl taint nodes --all node-role.kubernetes.io/master-

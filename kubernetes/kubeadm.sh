#!/bin/bash

# Source: https://kubernetes.io/docs/tasks/tools/install-kubeadm/

set -e
set -x

if command -v yum &>/dev/null
then
  yum install -y docker
  systemctl enable docker
  systemctl start docker

  cp kubernetes.repo /etc/yum.repos.d/kubernetes.repo

  setenforce 0
  yum install -y kubelet kubeadm kubectl
  systemctl enable kubelet && systemctl start kubelet

  systemctl daemon-reload
  systemctl restart kubelet
fi

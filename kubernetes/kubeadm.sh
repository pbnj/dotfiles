#!/bin/bash

# Source: https://kubernetes.io/docs/tasks/tools/install-kubeadm/

set -e
set -x

if command -v yum &>/dev/null; then
	sudo yum install -y docker
	sudo systemctl enable docker
	sudo systemctl start docker

	sudo -s 'cat <<EOF >/etc/yum.repos.d/kubernetes.repo
	[kubernetes]
	name=Kubernetes
	baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
	enabled=1
	gpgcheck=1
	repo_gpgcheck=1
	gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
	EOF'

	setenforce 0
	sudo yum install -y kubelet kubeadm kubectl
	sudo systemctl enable kubelet && systemctl start kubelet

	sudo systemctl daemon-reload
	sudo systemctl restart kubelet
fi

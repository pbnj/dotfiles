#!/bin/bash

# https://kubernetes.io/docs/tasks/tools/install-kubeadm/

set -e
set -x

if command -v yum &>/dev/null; then
	echo "## INSTALL DOCKER..."
	yum install -y docker
	systemctl enable docker
	systemctl start docker

	echo "## INSTALL KUBEADM, KUBECTL, KUBELET..."
	cat <<EOF >/etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
	setenforce 0
	yum install -y kubelet kubeadm kubectl
fi

if command -v apt &>/dev/null; then
	echo "## INSTALL DOCKER..."
	apt-get update
	apt-get install -y apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	add-apt-repository "deb https://download.docker.com/linux/$(
		. /etc/os-release
		echo "$ID"
	) $(lsb_release -cs) stable"
	apt-get update && apt-get install -y --allow-downgrades docker-ce="$(apt-cache madison docker-ce | grep 17.03 | head -1 | awk '{print $3}')"

	echo "## INSTALL KUBEADM, KUBECTL, KUBELET..."
	apt-get update && apt-get install -y apt-transport-https curl
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
	cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
	apt-get update
	apt-get install -y kubelet kubeadm kubectl
fi

echo "## STARTING SERVICES..."
systemctl enable kubelet && systemctl start kubelet
systemctl daemon-reload
systemctl restart kubelet

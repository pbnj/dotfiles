#!/bin/bash

set -e
set -x

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
	echo "usage: $0 <USERNAME> <CLUSTER_NAME> <SERVER_URL>"
	exit 1
fi

user=$1
cluster=$2
server=$3

# on client machine...
mkdir -p "$HOME/.kube/certs"
kubectl config set-credentials "$user" --client-certificate="$HOME/.kube/certs/$user.crt" --client-key="$HOME/.kube/certs/$user.key"
kubectl config set-context "$user-context" --cluster="$cluster" --user="$user"
kubectl config set-cluster "$cluster" --server="$server" --certificate-authority="$HOME/.kube/certs/ca.crt"

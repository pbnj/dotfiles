#!/bin/bash

set -e
set -x

if [ -z "$1" ]; then
	echo "usage: $0 <username>"
	exit 1
fi

# on master node...
user=$1

kubectl create clusterrolebinding permissive-binding \
	--clusterrole=cluster-admin \
	--user="$user"

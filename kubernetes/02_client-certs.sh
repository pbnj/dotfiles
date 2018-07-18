#!/bin/bash

set -e
set -x

if [ -z "$1" ]; then
	echo "usage: $0 <username>"
	exit 1
fi

# On master node...
user=$1

openssl genrsa -out "$user.key" 4096

openssl req \
	-new \
	-key "$user.key" \
	-out "$user.csr" \
	-subj "/CN=$user"

openssl x509 -req -in "$user.csr" \
	-CA /etc/kubernetes/pki/ca.crt \
	-CAkey /etc/kubernetes/pki/ca.key \
	-CAcreateserial -out "$user.crt" -days 10000

echo "Now, copy/send the $user.crt, $user.key, and the kubernetes CA (typically in /etc/kubernetes/pki) files over to the user"

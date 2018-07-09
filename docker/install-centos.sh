#!/bin/bash

set -e
set -x

yum install -y docker
systemctl enable docker && systemctl start docker


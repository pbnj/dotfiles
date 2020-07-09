#!/usr/bin/env bash

set -eou pipefail
set -x

apt-get update
apt-get install -y make

make dev


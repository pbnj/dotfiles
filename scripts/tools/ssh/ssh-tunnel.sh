#!/bin/bash

set -e
set -x

/usr/bin/ssh -i ~/.ssh/td_rsa -NR 2222:localhost:22 "${1}"

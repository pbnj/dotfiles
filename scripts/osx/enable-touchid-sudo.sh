#!/bin/bash

set -e
set -x

echo "auth sufficient pam_tid.so" | sudo tee -a /etc/pam.d/sudo

#!/usr/bin/env bash

set -e

while read ext; do
    code --install-extension $ext
done <extensions.txt

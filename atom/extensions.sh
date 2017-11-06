#!/bin/bash

DIR=$(dirname $0)
for ext in $(cat ${DIR}/apmfile); do
  apm install $ext
done

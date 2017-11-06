#!/bin/bash

set -ex

CWD="$(dirname $0)"
GOFILE="${CWD}/Gofile"
echo "## INSTALLING GO PACKAGES..."
for PKG in $(cat ${GOFILE}); do
  go get -u -v ${PKG}
done

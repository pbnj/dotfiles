#!/bin/bash

set -e
set -x

go env -w GO111MODULE="on"

go get -u -v sigs.k8s.io/kind@v0.7.0
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/gopls@latest
go get -u -v golang.org/x/lint/golint
go get -u -v github.com/pbnj/go-gitignore/...
go get -u -v github.com/tj/go-search

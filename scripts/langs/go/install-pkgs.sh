#!/bin/bash

set -e
set -x

go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/gopls@latest
go get -u -v github.com/pbnj/go-gitignore/...
go get -u -v github.com/tj/go-search

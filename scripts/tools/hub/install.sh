#!/bin/bash

set -e

if [[ "$(uname)" == "Darwin" ]]; then
	brew install hub
else
	HUB_PATH="$GOPATH/src/github.com/github"
	rm -rf "$HUB_PATH"
	mkdir -p "$HUB_PATH"
	git clone \
		--config transfer.fsckobjects=false \
		--config receive.fsckobjects=false \
		--config fetch.fsckobjects=false \
		https://github.com/github/hub.git "$HUB_PATH"
	make -C "$HUB_PATH" install prefix=/usr/local
fi

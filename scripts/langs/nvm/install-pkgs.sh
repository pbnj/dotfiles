#!/bin/bash

set -e
set -x

# Utilities
npm install -g \
	doctoc \
	prettier

# Language Servers
npm install -g \
	bash-language-server \
	dockerfile-language-server-nodejs

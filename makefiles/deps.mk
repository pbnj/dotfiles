################################################################################
# DEPENDENCIES
################################################################################

## Install dependencies. Must run manually first.
.PHONY: deps-deb
deps-deb:
	apt-get update
	apt-get install -y \
		ca-certificates \
		curl \
		git \
		stow \
		tmux \
		vim

# vim: ft=make

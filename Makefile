# vi: set ft=make :

.DEFAULT_GOAL := help
SHELL         := /bin/bash

PROJECT := dotfiles

-include makefiles/*.mk

.PHONY: help
help: ## Print help
	@grep -oh -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s	%s\n", $$1, $$2}'


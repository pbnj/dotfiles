################################################################################
# GO
################################################################################

## go
.PHONY: go
go:
	gh repo clone https://github.com/travis-ci/gimme $(PROJECT_DIR)/gimme
	chmod +x $(PROJECT_DIR)/gimme/gimme
	cp $(PROJECT_DIR)/gimme/gimme $(HOME)/bin/

## go-glab
.PHONY: go-glab
go-glab:
	gh release download --repo profclems/glab --pattern '*macOS*'

# vim: ft=make


#!/usr/bin/env bash

set -e

EXTENSIONS=(
    christian-kohler.path-intellisense
    DavidAnson.vscode-markdownlint
    eamodio.gitlens
    EditorConfig.EditorConfig
    esbenp.prettier-vscode
    formulahendry.auto-close-tag
    formulahendry.code-runner
    formulahendry.vscode-mysql
    foxundermoon.shell-format
    mads-hartmann.bash-ide-vscode
    mauve.terraform
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.kind-vscode
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-python.python
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    ms-vscode.Go
    ms-vsliveshare.vsliveshare
    redhat.vscode-yaml
    vscodevim.vim
    wwm.better-align
)

for ext in "${EXTENSIONS[@]}"; do
    code --install-extension $ext
done

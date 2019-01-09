# dotfiles

My dotfiles

## Table of Contents

- [Philosophy](#philosophy)
- [Getting Started](#getting-started)
- [Optional](#optional)

## Philosophy

Minimalistic (may be even brutally so):

- bash: no zsh/fish frameworks or fancy prompts. Few aliases and simple bash prompt.
- vim: no plugins or `.vimrc` even.
- tmux: no custom key bindings or fancy status bars.

## Getting Started

With `stow`:

```
stow {bash,tmux}
```
    
Without `stow`:

```
cp -rs bash/* $HOME/
cp -s tmux/* $HOME/
```
    
## Optional

Additional packages and programs (e.g. `go`, `jq`, `brew`) can be found under [scripts](./scripts) directory.

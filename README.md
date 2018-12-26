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
- tmux: basic key bindings/shortcuts.

## Getting Started

With `stow`:

    stow {bash,vim,tmux}
    
Without `stow`:

    for file in $(ls $HOME/.dotfiles/bash)
    do
      ln -s $file $HOME/$file
    done
    unset $file
    
    ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
    
## Optional

Additional packages and programs (e.g. `go`, `jq`, `brew`) can be found under [scripts](./scripts) directory.

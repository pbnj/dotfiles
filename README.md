# Dotfiles

My configuration files. Here be dragons.

## Vim

Thanks to Vim 8 Packages, I no longer need a vim package manager.

Instead, I rely on git and add packages as submodules when needed. For more
details, checkout this [write-up](https://shapeshed.com/vim-packages/).

TL;DR -

- Add a package: `git submodule add https://github.com/vim-airline/vim-airline.git vim/pack/shapeshed/start/vim-airline`
- Update packages: `git submodule update --remote --merge`
- Remove a package:
  ```sh
  git submodule deinit vim/pack/shapeshed/start/vim-airline
  git rm vim/pack/shapeshed/start/vim-airline
  rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
  ```


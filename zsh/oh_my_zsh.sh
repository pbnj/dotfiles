#! /usr/bin/env bash

# change shell to zsh
#chsh -s /bin/zsh
#sudo chsh -s /bin/zsh

DIR=$(dirname $0)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp ${DIR}/.zshrc ~/.zshrc

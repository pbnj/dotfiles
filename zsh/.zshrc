export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/pb250031/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	aws
	brew
	cargo
	command-not-found
	docker
	fzf
	git
	git-extras
	github
	helm
	jira
	kubectl
	ripgrep
	tmux
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
)

source $ZSH/oh-my-zsh.sh

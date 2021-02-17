set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -gx EDITOR vim
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden -g '!.git' -g '!node_modules' --sort=path"
set -gx GIT_TERMINAL_PROMPT 1

if test -d $HOME/bin
	set -gx PATH $HOME/bin $PATH
end

# work profile
if test -f $HOME/.config/fish/work.fish
	source $HOME/.config/fish/work.fish
end


# rm
function rm --wraps rm
	command rm -i $argv
end

# ls
function ls
	if type -q exa
		command exa $argv
	else
		command ls $argv
	end
end

# ll
function ll
	if type -q exa
		command exa --all --classify --long --git --group-directories-first $argv
	else
		command ls -alFh $argv
	end
end

# kubectl
abbr -a k kubectl
abbr -a kgp kubectl get pod
abbr -a kgd kubectl get deploy

# jira
set -gx JIRA_CONFIG $HOME/.jira-cli/config.json
abbr -a jls jira ls

# go
set -gx GODEBUG x509ignoreCN=0
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# git
abbr -a gco git checkout
abbr -a gd git diff
abbr -a gst git status -s
abbr -a gpull git pull --rebase
abbr -a gpush git push

# docker
abbr -a d docker
abbr -a dr docker run
abbr -a di docker image ls
abbr -a drm docker rm
abbr -a drmi docker rmi
abbr -a dsp docker system prune --volumes --force

# rbenv
rbenv init - | source

# vault
abbr -a v vault

# terraform
abbr -a tf terraform
abbr -a tfi terraform init
abbr -a tfa terraform apply
abbr -a tfaa terraform apply -auto-approve
abbr -a tfd terraform destroy
abbr -a tfda terraform destroy -auto-approve

# direnv
direnv hook fish | source

# starship
starship init fish | source

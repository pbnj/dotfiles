set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -gx EDITOR vim
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden -g '!.git' -g '!node_modules' --sort=path"
set -gx GIT_TERMINAL_PROMPT 1

if test -d $HOME/bin
	set -gx PATH $HOME/bin $PATH
end

if test -d $HOME/.local/bin
	set -gx PATH $HOME/.local/bin $PATH
end

if test -q go
	# if test -d $HOME/.gimme/envs/latest.env
	# 	source $HOME/.gimme/envs/latest.env
	# end

	set -gx GODEBUG x509ignoreCN=0
	set -gx GOPATH $HOME/go
	set -gx PATH $GOPATH/bin $PATH
end

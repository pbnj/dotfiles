set -x GOPATH $HOME
set -x PATH $PATH /usr/local/go/ $GOPATH/bin

function l --wraps ls
  if type -q gls
    gls -alFh --group-directories-first --color=auto $argv
  else
    ls -alFh --group-directories-first --color=auto $argv
  end
end

# Kubectl aliases/functions
if type -q kubectl
    abbr k "kubectl"
    abbr kgp "kubectl get pod"
    abbr kc "kube config"
end

# Git aliases/functions
if type -q git
    if type -q hub
      eval (hub alias -s)
    end

    abbr g git
    abbr ga git add
    abbr gaa git add --all
    abbr gcmsg git commit -m
    abbr gco git checkout
    abbr gp git push
    abbr gst git status
end

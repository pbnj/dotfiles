set -x GOPATH $HOME
set -x PATH $PATH $GOPATH/bin

function l --wraps ls
  if type -q gls
    gls -alFh --group-directories-first --color=auto $argv
  else
    ls -alFh --group-directories-first --color=auto $argv
  end
end

# Kubectl aliases/functions
function k --wraps kubectl
  kubectl $argv
end

# Git aliases/functions
if type -q hub
  eval (hub alias -s)
end

function g --wraps git
  git $argv
end

function gst --wraps "git status"
  git status $argv
end

function gl --wraps "git pull"
  git pull $argv
end

function gp --wraps "git push"
  git push $argv
end

function ga --wraps "git add"
  git add $argv
end

function gc --wraps "git commit"
  git commit $argv
end


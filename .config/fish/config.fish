set -x GOPATH $HOME
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# SSH
setenv SSH_ENV $HOME/.ssh/environment
function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    source $SSH_ENV > /dev/null
    ssh-add
end
function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      test_identities
    end
else
    if [ -f $SSH_ENV ]
      source $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      test_identities
    else
      start_agent
    end
end

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
    abbr gcl git clone
    abbr gd git diff
    abbr gcmsg git commit -m
    abbr gco git checkout
    abbr gp git push
    abbr gst git status
end

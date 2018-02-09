# Git
if type -q git
    if type -q hub
      eval (hub alias -s)
    end

    abbr -a g 'git'
    abbr -a ga 'git add'
    abbr -a gaa 'git add --all'
    abbr -a gb 'git branch'
    abbr -a gcb 'git checkout -b'
    abbr -a gcl 'git clone'
    abbr -a gcmsg 'git commit -m'
    abbr -a gco 'git checkout'
    abbr -a gd 'git diff'
    abbr -a gp 'git push'
    abbr -a grv 'git remote -v'
    abbr -a gs 'git status'

end

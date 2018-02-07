# vim: set ft=sh:

set -l normal (set_color normal)
set -l red (set_color red)
set -l normal (set_color normal)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

function fish_prompt
  set -l last_status $status

  echo -e ''
  echo -n -s (whoami)@(hostname | cut -d . -f 1):(set_color $fish_color_cwd)(prompt_pwd)(set_color normal)(__fish_git_prompt)

  set -l prompt_color $red
  if test $last_status = 0
    set prompt_color $normal
  end

  echo -e ''
  echo -e -n -s $prompt_color '$ ' $normal
end


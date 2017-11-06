local ret_status="%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})${PURITY_PROMPT_SYMBOL:-❯} "
# PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT='%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)
${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}${PURITY_GIT_PROMPT_DIRTY:-○} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}${PURITY_GIT_PROMPT_CLEAN:-●} "

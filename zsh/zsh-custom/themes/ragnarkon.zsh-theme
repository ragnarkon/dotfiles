# ragnarkon.zsh-theme

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
    PROMPT='[%(!.%{$fg[red]%}.%{$fg[green]%})%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}] \
[%{$fg[red]%}$(rbenv_prompt_info)\
%{$reset_color%}|%{$fg[yellow]%}$(pyenv_prompt_info)\
%{$reset_color%}|%{$fg[cyan]%}$(goenv_prompt_info)\
%{$reset_color%}|%{$fg[magenta]%}$(tfenv_prompt_info)\
%{$reset_color%}]\
 [%{$fg[blue]%}$(fmcc_prompt_info)\
%{$reset_color%}]\
$(git_prompt_info)$(git_prompt_status)%{$reset_color%}
%# '

#%{$reset_color%}|%{$fg[cyan]%}$(plenv_prompt_info)\

    ZSH_THEME_RUBY_PROMPT_PREFIX=""
    ZSH_THEME_RUBY_PROMPT_SUFFIX=""

    ZSH_THEME_PYTHON_PROMPT_PREFIX=""
    ZSH_THEME_PYTHON_PROMPT_SUFFIX=""

    ZSH_THEME_TERRAFORM_PROMPT_PREFIX=""
    ZSH_THEME_TERRAFORM_PROMPT_SUFFIX=""

    ZSH_THEME_GIT_PROMPT_PREFIX=" [%{$fg[green]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

    RPROMPT='${return_code}%{$reset_color%}'
#[%{$fg[red]%}$(rbenv_prompt_info)%{$reset_color%}]\
#[%{$fg[yellow]%}$(pyenv_prompt_info)%{$reset_color%}]\
#[%{$fg[cyan]%}$(plenv_prompt_info)%{$reset_color%}]'

    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
    PROMPT='[%n@%m:%~$(git_prompt_info)]
%# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%? ↵)"

    RPROMPT='${return_code}$(git_prompt_status)'

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi

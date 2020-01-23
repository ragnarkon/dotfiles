# Inactive by default so I don't do stupid things
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Add colors to Bash
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Prompt format and colors
if [ $(id -u) = 0 ]; then
  usercolor="01;31";
else
  usercolor="01;32";
fi

# Ruby rbenv
if [ -f /usr/local/bin/rbenv ]; then
  eval "$(/usr/local/bin/rbenv init -)"
fi

# Python pyenv
if [ -f /usr/local/bin/pyenv ]; then
  eval "$(/usr/local/bin/pyenv init -)"
fi

# Perl plenv
if [ -f /usr/local/bin/plenv ]; then
  eval "$(/usr/local/bin/plenv init -)"
fi

# thefuck
if [ -f /usr/local/bin/thefuck ]; then
  eval $(/usr/local/bin/thefuck --alias)
fi

# GPG Agent
export GPG_TTY=$(tty)

# Improved Git support in Bash
# Performance tuning.  Only add git into to prompt if on local machine
function ps1_gitLocalDir {
  pwd=$(pwd)
  if [[ "$pwd/" =~ ^/Volumes/ ]]; then
    PS1='\[\033[${usercolor}m\]\u\[\033[00m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
  else
    __git_ps1 "\[\033[${usercolor}m\]\u\[\033[00m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" " \$ " " [%s]"
  fi
}

# Git auto-completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Adds git info to prompt, otherwise defaults to generic prompt
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWCOLORHINTS=1
  #export PROMPT_COMMAND='__git_ps1 "\[\033[${usercolor}m\]\u\[\033[00m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" " \$ " " [%s]" '
  export PROMPT_COMMAND='ps1_gitLocalDir'
else
  PS1='\[\033[${usercolor}m\]\u\[\033[00m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
fi

export PS1

# Source profile
if [ -f ~/.profile ]; then
  source ~/.profile
fi

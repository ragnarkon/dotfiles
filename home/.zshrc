# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Determine what environment we're actually running in
case "$(uname -ra)" in
  *Microsoft*)  OS="WSL";;
  *microsoft*)  OS="WSL2";;
  Linux*)       OS="Linux";;
  Darwin*)      OS="macOS";;
  CYGWIN*)      OS="Cygwin";;
  MINGW*)       OS="Windows";;
  *Msys)        OS="Windows";;
  *)            OS="UNKNOWN:$(uname -r)"
esac

# Add Homebrew path to PATH
# Homebrew installs to a different path on ARM64 macOS devices
if [ "${OS}" = "macOS" ]; then
  if [ "$(arch)" = "arm64" ]; then
    if [ -d "/opt/homebrew/sbin" ]; then
      export PATH=/opt/homebrew/sbin:$PATH
    fi
    if [ -d "/opt/homebrew/bin" ]; then
      export PATH=/opt/homebrew/bin:$PATH
    fi
  else
    if [ -d "/usr/local/Homebrew/bin" ]; then
      export PATH=/usr/local/Homebrew/bin:$PATH
    fi
  fi
fi

# Path to Homesick castle
HOMESICK=$HOME/.homesick/repos/dotfiles

# Uncomment the following line to dynamically find the Homesick castle path.
# The variable value assumes you have install the Homesick gem under the
# system install of Ruby.
# HOMESICK="/usr/local/bin/homesick show_path)"

# Path to your oh-my-zsh installation.
export ZSH=$HOMESICK/zsh/oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ragnarkon"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOMESICK/zsh/zsh-custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  fmcc
  fzf
  git
  golang
  pdk
  thefuck
  goenv
  nodenv
  plenv
  pyenv
  rbenv
  tfenv
  kubectl
  stc
)

case $OS in
  WSL2)   plugins+=(wsl2-ssh-pageant);;
  *)      plugins+=(gpg-agent-custom);;
esac

source $ZSH/oh-my-zsh.sh

# User configuration

# Source ~/.profile
if [ -f ~/.profile ]; then
  source ~/.profile
fi

# Add custom bins to path
# $HOME/.bin contains bins shipped with this Homesick castle
# $HOME/bin can be used custom scripts
export PATH=$PATH:$HOME/.bin
if [ -e $HOME/bin ]; then
  export PATH=$PATH:$HOME/bin
fi

# Fix stupid LS_COLORS on Ubuntu.
# There is probably a better way to do this but I don't know what it is.
if [[ -f "/etc/os-release" && "$(awk -F= '/^NAME/{print $2}' /etc/os-release)" = "\"Ubuntu\"" ]]; then
  eval `dircolors`
  export LS_COLORS=$LS_COLORS:'ow=7;32:'
fi

# Fix terminal colors on macOS
if [ "${TERM_PROGRAM}" = "Apple_Terminal" ]; then
  export CLICOLOR=1
  # export LSCOLORS=ExFxBxDxCxegedabagacad
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ "${OS}" != "macOS" ]; then
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste="xclip -selection clipboard -o"
fi

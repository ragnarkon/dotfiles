
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

# Homebrew setup
if [[ "${OS}" == "macOS" ]]; then
  HOMEBREW_SETUP=1
fi

if [[ -n "${HOMEBREW_SETUP-}" ]]; then
  UNAME_ARCH="$(/usr/bin/uname -m)"

  if [[ "${UNAME_ARCH}" == "arm64" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    HOMEBREW_PREFIX="/usr/local"
  fi
  
  eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
fi

# Setup code *env stuff
if (( $+commands[rbenv] )); then
  eval "$(rbenv init - --no-rehash zsh)"
fi

if (( $+commands[pyenv] )); then
  eval "$(pyenv init - --no-rehash zsh)"
fi

if (( $+commands[goenv] )); then
  eval "$(goenv init - --no-rehash zsh)"
fi

if (( $+commands[nodenv] )); then
  eval "$(nodenv init - --no-rehash zsh)"
fi

if (( $+commands[tfenv] )); then
  eval "$(tfenv init - --no-rehash zsh)"
fi

if (( $+commands[plenv] )); then
  eval "$(plenv init - --no-rehash zsh)"
fi

_homebrew-installed() {
    type brew &> /dev/null
}

_plenv-from-homebrew-installed() {
    brew --prefix plenv &> /dev/null
}

FOUND_PLENV=0
plenvdirs=("$HOME/.plenv" "/usr/local/plenv" "/opt/plenv")

if _homebrew-installed && plenv_homebrew_path=$(brew --prefix plenv 2>/dev/null); then
  plenvdirs=($plenv_homebrew_path "${plenvdirs[@]}")
  unset plenv_homebrew_path
  if [[ $PLENV_ROOT = '' ]]; then
    PLENV_ROOT="$HOME/.plenv"
  fi
fi

for plenvdir in "${plenvdirs[@]}" ; do
    if [ -d $plenvdir/bin -a $FOUND_PLENV -eq 0 ] ; then
        FOUND_PLENV=1
        if [[ $PLENV_ROOT = '' ]]; then
          PLENV_ROOT=$plenvdir
        fi
        export PLENV_ROOT
        eval "$(plenv init - zsh)"

        function plenv_prompt_info() {
            echo "$(plenv version-name)"
        }
    fi
done
unset plenvdir

if [ $FOUND_PLENV -eq 0 ] ; then
    function plenv_prompt_info() { echo "system: $(perl -e 'print substr($^V, 1)')" }
fi

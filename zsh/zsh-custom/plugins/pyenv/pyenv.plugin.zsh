# This plugin loads pyenv into the current shell

FOUND_PYENV=$+commands[pyenv]

if [[ $FOUND_PYENV -ne 1 ]]; then
    pyenvdirs=("$HOME/.pyenv" "/usr/local/pyenv" "/opt/pyenv" "/usr/local/opt/pyenv")
    for dir in $pyenvdirs; do
        if [[ -d $dir/bin ]]; then
            export PYENV_ROOT=$dir
            export PATH="$PYENV_ROOT/bin:$PATH"
            FOUND_PYENV=1
            break
        fi
    done
fi

if [[ $FOUND_PYENV -ne 1 ]]; then
    if (( $+commands[brew] )) && dir=$(brew --prefix pyenv 2>/dev/null); then
        if [[ -d $dir/bin ]]; then
            export PYENV_ROOT=$dir
            export PATH="$PYENV_ROOT/bin:$PATH"
            FOUND_PYENV=1
        fi
    fi
fi

if [[ $FOUND_PYENV -eq 1 ]]; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init --no-rehash - zsh)"

    function current_python() {
        echo "$(pyenv version-name)"
    }


    function pyenv_prompt_info() {
        local python=${$(current_python):gs/%/%%}
        echo -n "${ZSH_THEME_PYTHON_PROMPT_PREFIX}"
        echo -n "${python}"
        echo "${ZSH_THEME_PYTHON_PROMPT_SUFFIX}"
    }
else
    function current_ruby() { echo "not supported" }
    function current_gemset() { echo "not supported" }
    function gems() { echo "not supported" }
    function rbenv_prompt_info() {
      echo -n "${ZSH_THEME_RUBY_PROMPT_PREFIX}"
      echo -n "system: $(python --version | cut -f-2 -d ' ' | sed 's/%/%%/g')"
      echo "${ZSH_THEME_RUBY_PROMPT_SUFFIX}"
    }
fi

unset FOUND_PYENV pyenvdirs dir

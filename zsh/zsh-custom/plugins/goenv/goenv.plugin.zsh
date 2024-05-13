# This plugin loads goenv into the current shell

FOUND_GOENV=$+commands[goenv]

if [[ $FOUND_GOENV -ne 1 ]]; then
    goenvdirs=("$HOME/.goenv" "/usr/local/goenv" "/opt/goenv" "/usr/local/opt/goenv")
    for dir in $goenvdirs; do
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_GOENV=1
            break
        fi
    done
fi

if [[ $FOUND_GOENV -ne 1 ]]; then
    if (( $+commands[brew] )) && dir=$(brew --prefix goenv 2>/dev/null); then
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_GOENV=1
        fi
    fi
fi

if [[ $FOUND_GOENV -eq 1 ]]; then
    eval "$(goenv init --no-rehash - zsh)"

    function current_golang() {
        echo "$(goenv version-name)"
    }

    function goenv_prompt_info() {
        local golang=${$(current_golang):gs/%/%%}
        echo -n "${ZSH_THEME_GOLANG_PROMPT_PREFIX}"
        echo -n "${golang}"
        echo -n "${ZSH_THEME_GOLANG_PROMPT_SUFFIX}"
    }
else
    function current_golang() { echo "not supported" }
    function pyenv_prompt_info() {
        echo -n "${ZSH_THEME_GOLANG_PROMPT_PREFIX}"
        echo -n "system: $(go --version | cut -f3 -d ' ' | sed 's/%/%%/g')"
        echo -n "${ZSH_THEME_GOLANG_PROMPT_SUFFIX}"
    }
fi

unset FOUND_GOENV goenvdirs dir

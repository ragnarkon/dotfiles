# This plugin loads plenv into the current shell

FOUND_PLENV=$+commands[plenv]

if [[ $FOUND_PLENV -ne 1 ]]; then
    plenvdirs=("$HOME/.plenv" "/usr/local/plenv" "/opt/plenv" "/usr/local/opt/plenv")
    for dir in $plenvdirs; do
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_PLENV=1
            break
        fi
    done
fi

if [[ $FOUND_PLENV -ne 1 ]]; then
    if (( $+commands[brew] )) && dir=$(brew --prefix plenv 2>/dev/null); then
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_PLENV=1
        fi
    fi
fi

if [[ $FOUND_PLENV -eq 1 ]]; then
    eval "$(plenv init --no-rehash - zsh)"
fi

unset FOUND_PLENV plenvdirs dir

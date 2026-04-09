# This plugin loads nodenv into the current shell

FOUND_NODENV=$+commands[nodenv]

if [[ $FOUND_NODENV -ne 1 ]]; then
    nodenvdirs=("$HOME/.nodenv" "/usr/local/nodenv" "/opt/nodenv" "/usr/local/opt/nodenv")
    for dir in $nodenvdirs; do
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_NODENV=1
            break
        fi
    done
fi

if [[ $FOUND_NODENV -ne 1 ]]; then
    if (( $+commands[brew] )) && dir=$(brew --prefix nodenv 2>/dev/null); then
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_NODENV=1
        fi
    fi
fi

if [[ $FOUND_NODENV -eq 1 ]]; then
    eval "$(nodenv init --no-rehash - zsh)"
fi

unset FOUND_NODENV nodenvdirs dir

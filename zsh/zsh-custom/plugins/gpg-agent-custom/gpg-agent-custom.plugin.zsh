# Most of this stuff came from here:
#   https://callanbryant.co.uk/blog/how-to-get-the-best-out-of-your-yubikey-with-gpg/#seamless-tmux-integration

function _tmux_update_env {
  # tmux must be running
  [ "$TMUX" ] || return

  # update current shell to parent tmux shell (useful for new SSH connections, x forwarding, etc)
  eval $(tmux show-environment -s | grep 'DISPLAY\|SSH_CONNECTION\|SSH_AUTH_SOCK')
}

function _update_agents {
  # take over SSH keychain (with gpg-agent soon) but only on local machine, not remote ssh machine
  # keychain used in a non-invasive way where it's up to you to add your keys to the agent.
  if [ ! "$SSH_CONNECTION" ] && which gpg-connect-agent &>/dev/null; then
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs | grep agent-ssh-socket | cut -f 2 -d :)
    # start GPG agent, and update TTY. For the former only, omit updatestartuptty
    # ssh-agent protocol can't tell gpg-agent/pinentry what tty to use, so tell it
    # if GPG agent has locked up or there is a stale remote agent, remove
    # the stale socket and possible local agent.
    if ! timeout -k 2 1 gpg-connect-agent updatestartuptty /bye > /dev/null; then
      echo "Removing stale GPG agent"
      socket=$(gpgconf --list-dirs | grep agent-socket | cut -f 2 -d :)
      test -S $socket && rm $socket
      killall -KILL gpg-agent 2> /dev/null
      # try again
      timeout -k 2 1 gpg-connect-agent updatestartuptty /bye > /dev/null
    fi
  fi
}

export GPG_TTY=$TTY
add-zsh-hook preexec _tmux_update_env
add-zsh-hook preexec _update_agents

function gssh {
  echo "Preparing host for forwarded GPG agent..." >&2

  # prepare remote for agent forwarding, get socket
  # Remove the socket in this pre-command as an alternative to requiring
  # StreamLocalBindUnlink to be set on the remote SSH server.
  # Find the path of the agent socket remotely to avoid manual configuration
  # client side. The location of the socket varies per version of GPG,
  # username, and host OS.
  remote_socket=$(cat <<'EOF' | command ssh -T "$@" bash
    set -e
    socket=$(gpgconf --list-dirs | grep agent-socket | cut -f 2 -d :)
    # killing agent works over socket, which might be dangling, so time it out.
    timeout -k 2 1 gpgconf --kill gpg-agent || true
    test -S $socket && rm $socket
    echo $socket
EOF
)
  if [ ! $? -eq 0 ]; then
    echo "Problem with remote GPG. use ssh -A $@ for ssh with agent forwarding only." >&2
    return
  fi

  if [ "$SSH_CONNECTION" ]; then
    # agent on this host is forwarded, allow chaining
    local_socket=$(gpgconf --list-dirs | grep agent-socket | cut -f 2 -d :)
  else
    # agent on this host is running locally, use special remote socket
    local_socket=$(gpgconf --list-dirs | grep agent-extra-socket | cut -f 2 -d :)
  fi

  if [ ! -S $local_socket ]; then
    echo "Could not find suitable local GPG agent socket" 2>&1
    return
  fi

  echo "Connecting..." >&2
  ssh -A -R $remote_socket:$local_socket "$@"
}

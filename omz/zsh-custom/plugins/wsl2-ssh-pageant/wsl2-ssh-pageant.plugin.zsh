wsl2_ssh_pageant_bin="$HOME/.ssh/wsl2-ssh-pageant.exe"
wsl2_ssh_pageant_conf_path="C\:/Users/$(wslvar USERNAME)/AppData/Local/gnupg"

export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"
if ! ss -a | grep -q "$SSH_AUTH_SOCK"; then
  rm -f "$SSH_AUTH_SOCK"
  if test -x "$wsl2_ssh_pageant_bin"; then
    (setsid nohup socat UNIX-LISTEN:"$SSH_AUTH_SOCK,fork" EXEC:"$wsl2_ssh_pageant_bin --gpgConfigBasepath ${wsl2_ssh_pageant_conf_path}" >/dev/null 2>&1 &)
  else
    echo >&2 "WARNING: $wsl2_ssh_pageant_bin is not executable."
  fi
fi

export GPG_AGENT_SOCK="$HOME/.gnupg/S.gpg-agent"
if ! ss -a | grep -q "$GPG_AGENT_SOCK"; then
  rm -rf "$GPG_AGENT_SOCK"
  if test -x "$wsl2_ssh_pageant_bin"; then
    (setsid nohup socat UNIX-LISTEN:"$GPG_AGENT_SOCK,fork" EXEC:"$wsl2_ssh_pageant_bin --gpgConfigBasepath ${wsl2_ssh_pageant_conf_path} --gpg S.gpg-agent" >/dev/null 2>&1 &)
  else
    echo >&2 "WARNING: $wsl2_ssh_pageant_bin is not executable."
  fi
fi

unset wsl2_ssh_pageant_bin
unset wsl2_ssh_pageant_conf_path

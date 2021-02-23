# This plugin loads tfenv into the current shell and provides prompt info via
# the 'tfenv_prompt_info' function.
# Based off of the rbenv plugin.

FOUND_TFENV=$+commands[tfenv]

if [[ $FOUND_TFENV -ne 1 ]]; then
  tfenvdirs=("$HOME/.tfenv" "/usr/local/tfenv" "/opt/tfenv" "/usr/local/opt/tfenv")
  for dir in $tfenvdirs; do
    if [[ -d $dir/bin ]]; then
      export PATH="$dir/bin:$PATH"
      FOUND_TFENV=1
      break
    fi
  done
fi

if [[ $FOUND_TFENV -ne 1 ]]; then
  if (( $+commands[brew] )) && dir=$(brew --prefix tfenv 2>/dev/null); then
    if [[ -d $dir/bin ]]; then
      export PATH="$dir/bin:$PATH"
      FOUND_TFENV=1
    fi
  fi
fi

if [[ $FOUND_TFENV -eq 1 ]]; then
  alias terraforms="tfenv list"

  function current_terraform() {
    local tfver=$(tfenv version-name 2>/dev/null)
    if [[ -z $tfver ]]; then
      echo "none"
    else
      echo "$tfver"
    fi
  }

function tfenv_prompt_info() {
  local terraform=$(current_terraform)
  echo -n "${ZSH_THEME_TERRAFORM_PROMPT_PREFIX}"
  echo -n "${terraform}"
  echo "${ZSH_THEME_TERRAFORM_PROMPT_SUFFIX}"
}
else
  alias terraforms="terraform --version"
  function tfenv_prompt_info() {
    echo -n "${ZSH_THEME_TERRAFORM_PROMPT_PREFIX}"
    echo -n "system: $(terraform --version | head -1 | cut -f-2 -d ' ')"
    echo "${ZSH_THEME_TERRAFORM_PROMPT_SUFFIX}"
  }
fi

unset FOUND_TFENV tfenvdirs dir

function get_ksenv_env() {
  local gcloud_config="$(gcloud config get project)"
  local kube_context="$(kubectl config current-context | awk -F'[._]' '{print $2}')"

  if [[ "${gcloud_config}" = '' || "${kube_context}" = '' ]]; then
    echo -n "unknown"
  fi
  if [[ "${gcloud_config}" == "${kube_context}" ]]; then
    echo -n $gcloud_config | awk -F'[.-]' '{printf "%s-%s",$2,$3}'
  else
    echo -n "!MIXED!"
  fi
}

function ksenv_prompt_info() {
  local ks_env=$(get_ksenv_env)
  echo -n "${ZSH_THEME_STC_PROMPT_PREFIX}"
  echo -n "${ks_env}"
  echo "${ZSH_THEME_STC_PROMPT_SUFFIX}"
}

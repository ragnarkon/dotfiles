_homebrew-installed() {
  type brew &> /dev/null
}

FOUND_PDK=0
pdkdirs=("/opt/puppetlabs/pdk")
if _homebrew-installed && pdk_homebrew_path=$(brew --prefix pdk 2>/dev/null); then
  pdkdirs=($pdk_homebrew_path "${pdkdirs[@]}")
  unset pdk_homebrew_path
fi

for pdkdir in "${pdkdirs[@]}" ; do
  if [ -d $pdkdir/bin -a $FOUND_PDK -eq 0 ]; then
    FOUND_PDK=1
    if [[ $PDK_ROOT = '' ]]; then
      PDK_ROOT=$pdkdir
    fi

    #export PATH=${pdkdir}/bin:$PATH

    # Load per-module PDK settings from CWD
    function load_pdk_config() {
      local root=$(pwd)
      while [ -n "$root" ]; do
        if [ -s "${root}/.pdkconfig" ]; then
          source $root/.pdkconfig
          break
        fi
        root="${root%/*}"
      done

      if [ "$pe_version" ]; then
        pupver="$pe_version"
        local puparg="--pe-version=${pupver}"
      elif [ "$puppet_version" ]; then
        pupver="$puppet_version"
        local puparg="--puppet-version=${pupver}"
      else
        pupver="latest"
        local puparg=""
      fi

      if [ "$clean_fixtures" = false ]; then
        uparams="${puparg}"
      else
        uparams="--clean-fixtures ${puparg}"
      fi

      if [ "$parallel" = false ]; then
        vparams="${puparg}"
      else
        vparams="--parallel ${puparg}"
      fi
    }

    # Unset all of the variables to prevent bleed between modules
    function unset_pdk_config() {
      unset pe_version
      unset puppet_version
      unset clean_fixtures
      unset parallel
      unset uparams
      unset vparams
      unset pupver
    }

    alias pdku="load_pdk_config; pdk test unit ${uparams}; unset_pdk_config"
    alias pdkv="load_pdk_config; pdk validate ${vparams}; unset_pdk_config"
    alias pdka="load_pdk_config; pdk validate ${vparams} && pdk test unit ${uparams}; unset_pdk_config"

    function current_pdk_puppetver() {
      load_pdk_config
      echo "$pupver"
      unset_pdk_config
    }

    function current_pdk() {
      echo "$(pdk --version)"
    }
  fi
done
unset pdkdir

_homebrew-installed() {
  type brew &> /dev/null
}

FOUND_PUPPET=0
puppetdirs=("/opt/puppetlabs")
if _homebrew-installed && puppet_homebrew_path=$(brew --prefix puppet 2>/dev/null); then
  puppetdirs=($puppet_homebrew_path "${puppetdirs[@]}")
  unset puppet_homebrew_path
fi

for puppetdir in "${puppetdirs[@]}" ; do
  if [ -d $puppetdir/bin -a $FOUND_PUPPET -eq 0 ] ; then
    FOUND_PUPPET=1
    if [[ $PUPPET_ROOT = '' ]]; then
      PUPPET_ROOT=$puppetdir
    fi

    export PUPPET_ROOT
    export PATH=${puppetdir}/bin:$PATH

    function current_puppet() {
      echo "$(puppet --version)"
    }

  fi
done
unset puppetdir

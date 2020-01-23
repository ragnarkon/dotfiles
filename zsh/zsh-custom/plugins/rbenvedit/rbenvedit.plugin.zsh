_homebrew-installed() {
  type brew &> /dev/null
}

FOUND_RBENV=0
rbenvdirs=("$HOME/.rbenv" "/usr/local/rbenv" "/opt/rbenv" "/usr/local/opt/rbenv")
if _homebrew-installed && rbenv_homebrew_path=$(brew --prefix rbenv 2>/dev/null); then
    rbenvdirs=($rbenv_homebrew_path "${rbenvdirs[@]}")
    unset rbenv_homebrew_path
fi

for rbenvdir in "${rbenvdirs[@]}" ; do
  if [ -d $rbenvdir/bin -a $FOUND_RBENV -eq 0 ] ; then
    FOUND_RBENV=1

    function current_gemset() {
      echo "$(rbenv gemset active 2&>/dev/null | sed -e '$ s/ global//gp' | head -n1)"
    }

  fi
done
unset rbenvdir

if [ $FOUND_RBENV -eq 0 ] ; then
  function rbenv_prompt_info() { echo "system: $(ruby -v | cut -f 2 -d ' ')" }
fi

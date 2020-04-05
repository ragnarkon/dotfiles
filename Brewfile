tap "homebrew/core"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-fonts"

# Core Apps
brew "bash"                                    # Shell
brew "git"                                     # Source code manager
brew "gnupg"                                   # GnuPG, for signed Git commits
brew "tmux"                                    # Terminal multiplexer
brew "tmux-cssh"                               # Multi-ssh connection helper for Tmux
brew "vim", args: ["with-override-system-vi"]  # Text editor
brew "zsh"                                     # Shell

# Not Core, but still needed
brew "kubernetes-helm"                         # K8S 'package' manager
brew "terraform"                               # Resource provisioning tool

# Languages
## Ruby
brew "ruby"                                    # Ruby
brew "ruby-build"                              # Builds Ruby
brew "rbenv"                                   # Shim manager for Ruby
## Python
brew "python"                                  # Python
brew "pyenv"                                   # Shim manager for Python
brew "pipenv"                                  # Python package dependency manager
## Perl
brew "perl"                                    # Perl
brew "perl-build"                              # Builds Perl
brew "plenv"                                   # Shim manager for Perl
brew "cpanminus"                               # CLI tool for CPAN
## Go
brew "go"                                      # Golang

# Helpful CLI utilities
brew "bat"                                     # Fancy 'cat' replacement
brew "dos2unix"                                # CRLF <-> LF conversion
brew "exa"                                     # Fancy 'ls' replacement
brew "jq"                                      # JSON parser/processor
brew "httpie"                                  # Like 'curl', but easier
brew "pandoc"                                  # Converts between doc formats
brew "thefuck"                                 # Fat finger fixer
brew "watch"                                   # Run command on schedule, watch output
brew "yamllint"                                # Lints YAML files.
brew "xsv"                                     # CSV toolkit

# Core Casks
cask "dash"                                    # API browser
cask "docker"                                  # Containers
cask "drawio"                                  # Flowcharts
cask "iterm2"                                  # Terminal emulator
cask "powershell"                              # Windows automation & config framework
cask "visual-studio-code"                      # Code editor
cask "wireshark"                               # Network analysis

# Fonts
cask "font-source-code-pro"                    # Font of choice

# Puppet Specific
tap "puppetlabs/puppet"
brew "wash"                                    # Puppet Wash
cask "puppet-agent"                            # Puppet Agent
cask "puppet-bolt"                             # Puppet Bolt
cask "pdk"                                     # Puppet Development Kit

# Public Cloud Providers
brew "awscli"                                  # Amazon Web Services CLI
brew "azure-cli"                               # Microsoft Azure CLI
brew "doctl"                                   # Digital Ocean
cask "google-cloud-sdk"                        # Google Cloud SDK

# Day-to-day apps
cask "1password"                               # Password manager
cask "google-chrome"                           # Web browser
cask "slack"                                   # Collaboration

# App Store Apps
brew "mas"                                     # CLI to the App Store
mas "Bear", id: 1091189122                     # Note taking app
mas "SnippetsLab", id: 1006087419              # Code snippet manager
mas "Microsoft Remote Desktop", id: 1295203466 # RDP client

# As needed
# cask "firefox"                               # Web browser
# cask "monodraw"                              # ASCII flowcharts
# cask "textual"                               # IRC client
# cask "vagrant"                               # VM manager
# cask "viscosity"                             # OpenVPN. open-source alternative: tunnelblick
# cask "vmware-fusion"                         # Hypervisor
# cask "vmware-remote-console"                 # VM consoles from vCenter/ESXi
# cask "xquartz"                               # X11

# Cool, but practically pointless
# brew "neofetch", args: ["without-imagemagick"] # Displays OS Info

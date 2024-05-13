#!/usr/bin/env bash

# Bootstrap script for ragnarkon/dotfiles

# Ask for sudo password
echo "Enter sudo password..."
sudo -v

# Sudo Keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode Tools
echo "Installing Xcode Tools..."
xcode-select --install

# Install homebrew
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Ruby & Homesick
# TODO: ADD STUFF TO PATH
brew install rbenv
rbenv install 3.3.1
eval "$(rbenv init -)"
rbenv shell 3.3.1
gem install homesick --no-document
rbenv rehash

# Setup Homesick Castle
homesick clone ragnarkon/dotfiles
homesick symlink dotfiles

# Install apps from Brewfile
echo "Installing apps from Brewfile..."
brew bundle --file=~/.homesick/repos/dotfiles/Brewfile
brew cleanup

echo "Changing default shell to zsh..."
sudo dscl . -create "/Users/$USER" UserShell /usr/local/bin/zsh

# Install iTerm colors
# echo "Installing 'One Dark' & 'One Light' colors for iTerm2..."
# open ~/.homesick/repos/dotfiles/colors/atom-one-dark-terminal/scheme/iterm/One\ Dark.itermcolors
# open ~/.homesick/repos/dotfiles/colors/atom-one-dark-terminal/scheme/iterm/One\ Light.itermcolors

echo "Finished!"
echo
read -r -p "Reboot? [y/n]: " ans
if [[ $ans =~ ^[Yy]$ ]]; then
  sudo reboot
fi

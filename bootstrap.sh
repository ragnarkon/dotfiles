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

# TODO: Add Xcode wait loop
# xcode-select -p 1>/dev/null;echo $?

# Install homebrew
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Homesick
brew install rbenv
rbenv install 3.3.6
eval "$(rbenv init - --no-rehash zsh)"
rbenv shell 3.3.6
gem install homesick --no-document

# Setup Homesick Castle
homesick clone ragnarkon/dotfiles
homesick symlink dotfiles

# Install apps from Brewfile
echo "Installing apps from Brewfile..."
brew bundle --file=~/.homesick/repos/dotfiles/Brewfile
brew cleanup

echo "Finished!"
echo
read -r -p "Reboot? [y/n]: " ans
if [[ $ans =~ ^[Yy]$ ]]; then
  sudo reboot
fi

# Dotfiles repo

I work in IT operations in the development engineering group (one of the handful of SRE-like teams) for a Fortune 500 company. My team in particular is responsible for System Center Configuration
Manager (Microsoft systems management product), Jamf Pro (macOS/iOS management suite), and Puppet (configuration management tool), along with the various custom integrations between these
tools and other systems used within the company.

Most of my profile consists of tools and utilities common in the IT world, but there are several product-specific tools/configs related to my day-to-day work. In other words... don't blindly
apply my dotfiles to your profile, you probably won't get the results you are looking for.

## Bootstrap

`curl -O https://raw.githubusercontent.com/ragnarkon/dotfiles/master/bootstrap.sh && chmod u+x bootstrap.sh && bootstrap.sh`

## Manual-ish Installation

I use [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.

1. Install Homesick: `/usr/bin/gem install homesick`
2. Clone this repository (known as a "Castle" in Homesick speak): `homesick clone ragnarkon/dotfiles`
3. Symlink the dotfiles: `homesick symlink dotfiles`
4. Install Homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
5. Install packages/applications: `cd $(homesick show_path) && brew bundle`

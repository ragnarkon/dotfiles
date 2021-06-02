# Dotfiles repo

I work in IT operations in the cloud engineering group (one of the handful of SRE-like teams) for a Fortune 500 company. My team is responsible for all things public cloud,
as well as integrations between the public cloud and our "traditional" data centers.

My focus in particular revolves around various infrastructure-as-code tools (ie. Terraform) and configuration management tools (ie. Puppet). Therefore, my dotfiles repo
will be heavily opinionated towards using those tools. That said, most of this repo consists of tools and utilities are common across the IT world.

## Bootstrap

`curl -O https://raw.githubusercontent.com/ragnarkon/dotfiles/master/bootstrap.sh && chmod u+x bootstrap.sh && ./bootstrap.sh`

ps. I just setup a new laptop tonight and this thing is totally broken. Will fix later.

## Manual-ish Installation

I use [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.

1. Install Homesick: `/usr/bin/gem install homesick`
2. Clone this repository (known as a "Castle" in Homesick speak): `homesick clone ragnarkon/dotfiles`
3. Symlink the dotfiles: `homesick symlink dotfiles`
4. Install Homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
5. Install packages/applications: `cd $(homesick show_path) && brew bundle`

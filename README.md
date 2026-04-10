# Dotfiles repo

Your typical Dotfiles repo for your typical DevOps guy.

My focus in particular revolves around various infrastructure-as-code tools (ie. Terraform), configuration management tools (ie. Puppet), and various CI/CD pipelines. Therefore,
my dotfiles repo will be heavily opinionated towards using those tools. That said, most of this repo consists of tools and utilities are common across the IT world.

## Bootstrap

I manage my Dotfiles with [chezmoi](https://github.com/twpayne/chezmoi)-super awesome, highly recommended. chezmoi is written in Golang and allows for one-line installation
of your dotfiles repository.

```shell
# sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ragnarkon
```

## Stuff I Use

This is the core stuff most people care about:

- Operating System: macOS
- Terminal: ghostty
- Shell: Zsh
- Package Manager: Homebrew
- Editor: vim / neovim
- Languages: Ruby, Golang, Python, Terraform/OpenTofu, Puppet

Checkout [Brewfile](Brewfile), [Brewfile.home](Brewfile.home), and [Brewfile.work](Brewfile.work) if you want a complete list of tools I use.

Obviously, this profile is written with macOS in mind. In the past I used Linux, so it is written in a way that it should *mostly* work on Linux-but expect an uphill battle.
If you want the Windows equivalent of this repo, checkout the not-well-maintained [dotfiles-windows](https://github.com/ragnarkon/dotfiles-windows.git) repo.

## Manual-ish Installation

1. Install chezmoi with you favorite package manager. (ie. `brew install chezmoi`)
2. Clone this repository an run the init process: `chezmoi init https://github.com/ragnarkon/dotfiles.git`
3. Answer the prompts during the init process. (This is primarily to setup `~/.gitconfig`)
4. Run `chezmoi apply` to place your dotfiles in the correct location

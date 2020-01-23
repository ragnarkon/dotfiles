#!/bin/bash

read -p "[Git Setup] Enter user name: " USER
read -p "[Git Setup] Enter email: " EMAIL

git config --global user.name "$USER"
git config --global user.email $EMAIL
git config --global color.ui true
git config --global core.editor `which vim`
git config --global core.ignorecase false
git config --global core.excludesfile ~/.gitignore
git config --global diff.tool `which vimdiff`
git config --global merge.tool `which vimdiff`
git config --global pager.branch false
git config --global pager.tag false

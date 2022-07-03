#!/bin/bash

if [ "$(id -u)" == "0" ]; then
    echo "This script should not be run as root"
    exit 1
fi

git clone "--separate-git-dir=${XDG_CONFIG_HOME:-~/.config}/dotfile-gitdir" "git@github.com:ehllie/my-dotfiles.git" "${XDG_CACHE_HOME:-~/.cache}/dotfile-gitdir"
rm -r "${XDG_CACHE_HOME:-~/.cache}/dotfiles"
alias config='git --git-dir=${XDG_CONFIG_HOME:-~/.config}/dotfile-gitdir --work-tree=$HOME'
config update-index --assume-unchanged $HOME/{README.md,bootstrap.sh}
config config status.showUntrackedFiles no
config status
echo "Force sync with remote? y/n"
read -r force
if [ "$force" == "y" ]; then
    config pull
fi
rm $HOME/{README.md,bootstrap.sh}

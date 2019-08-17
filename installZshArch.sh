#!/bin/sh
sudo pacman -S zsh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
sh $DIR/.shell/installZsh.sh

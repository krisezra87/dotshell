#!/bin/bash

pacman -S zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set up Zsh auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/plugins/zsh-autosuggestions

# CP git-auto-status file into ~/.oh-my-zsh/plugins/git-auto-status/git-auto-status.plugin.zsh

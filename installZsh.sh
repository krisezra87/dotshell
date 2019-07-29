#!/bin/bash
pacman -S zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set up Zsh auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/plugins/zsh-autosuggestions

ln -sf ~/.shell/zshrc ~/.zshrc

mkdir -p ~/.oh-my-zsh/plugins/git-auto-status
ln -sf ~/.shell/git-auto-status.plugin.zsh ~/.oh-my-zsh/plugins/git-auto-status/git-auto-status.plugin.zsh

ln -sf ~/.shell/kris.zsh-theme ~/.oh-my-zsh/themes/kris.zsh-theme

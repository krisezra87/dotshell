#!/bin/sh
# Set up Zsh auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

ln -sf ~/.shell/zsh/zshrc ~/.zshrc
ln -sf ~/.shell/zsh/.fzf.zsh ~/.fzf.zsh

mkdir -p ~/.oh-my-zsh/plugins/git-auto-status
ln -sf ~/.shell/zsh/git-auto-status.plugin.zsh ~/.oh-my-zsh/plugins/git-auto-status/git-auto-status.plugin.zsh

ln -sf ~/.shell/zsh/kris.zsh-theme ~/.oh-my-zsh/themes/kris.zsh-theme

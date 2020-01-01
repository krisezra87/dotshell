#!/bin/bash
# Set up Zsh auto suggestions
mkdir -p ~/.zsh

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions

ln -sf ~/.shell/zsh/zshrc ~/.zshrc
ln -sf ~/.shell/zsh/.fzf.zsh ~/.fzf.zsh

for file in ~/.shell/zsh/zshconfig/*.zsh
do
    ln -sf $file ~/.zsh/$(basename $file)
done

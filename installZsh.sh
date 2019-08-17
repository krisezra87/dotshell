#!/bin/bash
echo "Running zsh installer..."

# Don't need detached head nonsense if using submodules
git checkout master

shopt -s dotglob

# Get the directory of this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Check if the .bash folder already exists, if it does, move it.
FLAG=true
if [ $DIR == ~/.shell ]; then
    echo ".shell is properly located"
    FLAG=false
else
    if [ -d ~/.shell ]; then
        mv ~/.shell ~/.shell.old
    fi
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set up Zsh auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

ln -sf ~/.shell/zsh/zshrc ~/.zshrc

mkdir -p ~/.oh-my-zsh/plugins/git-auto-status
ln -sf ~/.shell/zsh/git-auto-status.plugin.zsh ~/.oh-my-zsh/plugins/git-auto-status/git-auto-status.plugin.zsh

ln -sf ~/.shell/zsh/kris.zsh-theme ~/.oh-my-zsh/themes/kris.zsh-theme

# Install tmux
bash ~/.shell/installTmux.sh

#!/bin/bash
echo "Running bash installer..."

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

# Check if the .inputrc file already exists, if it does, move it.
if [ -f ~/.inputrc ]; then
    mv ~/.inputrc ~/.inputrc.old
fi

if $FLAG; then
    mkdir -p ~/.shell
    mv $DIR/* ~/.shell/
    cd ~
    rmdir $DIR
fi

# Add to .bashrc
echo "source ~/.shell/bash/bash_config" >> ~/.bashrc
echo "source ~/.shell/bash/bash_colors" >> ~/.bashrc
echo "source ~/.shell/shell_aliases" >> ~/.bashrc
echo "source ~/.shell/shell_functions" >> ~/.bashrc

# Add to .bash_profile
echo "source ~/.bashrc" >> ~/.bash_profile

ln -sf ~/.shell/bash/inputrc ~/.inputrc
ln -sf ~/.shell/bash/.fzf.bash ~/.fzf.bash

# Install tmux
bash ~/.shell/installTmux.sh

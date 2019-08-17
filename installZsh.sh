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

if $FLAG; then
    mkdir -p ~/.shell
    mv $DIR/* ~/.shell/
    cd ~
    rmdir $DIR
fi

# Note, must exit from zsh for changes to take effect.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ; ~/.shell/zsh/configureZsh.sh ; ~/.shell/installTmux.sh

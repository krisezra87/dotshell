#!/bin/bash

# Check if the .tmux folder already exists, if it does, move it.
if [ -d ~/.tmux ]; then
    mv ~/.tmux ~/.tmux.old
fi

ln -sf ~/.shell/tmux/tmux_files ~/.tmux
ln -sf ~/.shell/tmux/tmux.conf ~/.tmux.conf

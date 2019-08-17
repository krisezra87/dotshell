#!/bin/bash
FILE=/usr/lib/python3.*/site-packages/powerline/bindings/tmux/powerline.conf

# Do an expansion on the file to find it.
FILE=`echo $FILE`
if [[ -s "$FILE" ]] ; then
    tmux source-file $FILE
fi

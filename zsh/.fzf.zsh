# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kezra/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/kezra/.fzf/bin"
fi

source <(fzf --zsh)

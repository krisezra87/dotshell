# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kezra/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/kezra/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kezra/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/kezra/.fzf/shell/key-bindings.zsh"

# Add a default command to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/$USER/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/$USER/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/$USER/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/$USER/.fzf/shell/key-bindings.zsh"

# Add a default command to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/$USER/.local/share/nvim/site/pack/packer/start/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/$USER/.local/share/nvim/site/pack/packer/start/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/$USER/.local/share/nvim/site/pack/packer/start/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/$USER/.local/share/nvim/site/pack/packer/start/fzf/shell/key-bindings.zsh"

# Add a default command to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden'

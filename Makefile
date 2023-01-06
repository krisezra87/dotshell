CONFIG_PATH:=$(HOME)/.shell

all: github link_configs change_shell

github:
	@[[ -d $(CONFIG_PATH) ]] || git clone git@github.com:krisezra87/dotshell.git $(CONFIG_PATH)

link_configs:
	@echo "Creating symbolic links for zsh"
	@ln -sf ~/.shell/zsh/zshrc ~/.zshrc
	@ln -sf ~/.shell/zsh/.fzf.zsh ~/.fzf.zsh

change_shell:
	@chsh -s /usr/bin/zsh $(USER)

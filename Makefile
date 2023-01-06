CONFIG_PATH:=$(HOME)/.shell

all: github link_configs change_shell

github:
	@[[ -d $(CONFIG_PATH) ]] || git clone git@github.com:krisezra87/dotshell.git $(CONFIG_PATH)

link_configs:
	@echo "Creating symbolic links for zsh"
	@ln -sf ~/.shell/zsh/zshrc ~/.zshrc
	@ln -sf ~/.shell/zsh/.fzf.zsh ~/.fzf.zsh

change_shell:
	[[ -z $(grep $(USER) /etc/passwd | grep zsh) ]] && \
		{ echo "Setting shell to zsh..."; \
			chsh -s $(chsh -l | grep zsh | tail -n 1) $(USER); }

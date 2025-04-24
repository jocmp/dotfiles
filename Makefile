EXCLUDE := README.md Makefile Brewfile
FILES := $(shell ls)
SOURCES := $(filter-out $(EXCLUDE),$(FILES))
DOTFILES := $(patsubst %, ${HOME}/.%, $(SOURCES))
VIM_PLUG := ${HOME}/.vim/autoload/plug.vim
VSCODE_PATH := ${HOME}/Library/Application\ Support/Code/User
VSCODE_EXTENSIONS_FILE := vscode/extensions.txt

.PHONY: update brew-install brew-bundle uninstall dotfiles git-user vscode-extensions save-vscode-extensions
dotfiles: $(DOTFILES) ## Links the the dotfiles in this directory to your $HOME, existing files will be ignored
git-user: ${HOME}/.gituser ## Set up your git user config so your commits have your name and email on them
install: dotfiles brew-install brew-bundle vim-install git-user vscode-extensions # all: $(DOTFILES) vim-install

$(DOTFILES): $(addprefix ${HOME}/., %) : ${PWD}/%
	-ln -s $< $@ || echo "could not link $< -- you may have an existing dotfile"

${HOME}/.gituser:
	@read -p "Enter Your Full Name for Git Commits: " name; \
		read -p "Enter Your Email for Git Commits: " email; \
		git config -f ~/.gituser user.name "$$name"; \
		git config -f ~/.gituser user.email "$$email"
		git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

brew-install: ## Install brew, you should only need to do this once
	ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew-bundle: ## Installs all the applications listed in the Brewfile
	brew bundle

uninstall: ## Uninstalls the currently linked files in your $HOME
	@echo $(DOTFILES) | xargs -n 1 sh -c 'unlink $$0 || true'

vscode-config: ## Install vscode config
	mkdir -p $(VSCODE_PATH)
	ln -si ${PWD}/vscode/keybindings.json $(VSCODE_PATH)
	ln -si ${PWD}/vscode/settings.json $(VSCODE_PATH)

user-bin: ## User's binaries
	ln -rs bin ${HOME}/

NODENV_ROOT := ${HOME}/.nodenv
RBENV_ROOT := ${HOME}/.rbenv

env-managers: ## Install env managers
	-git clone https://github.com/nodenv/nodenv.git ${NODENV_ROOT} || echo "nodenv already cloned"
	-git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT} || echo "rbenv already cloned"
	mkdir -p ${NODENV_ROOT}/plugins ${RBENV_ROOT}/plugins
	-git clone https://github.com/nodenv/node-build.git ${NODENV_ROOT}/plugins/node-build || echo "node-build already cloned"
	-git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)"/plugins/nodenv-update || echo || "node-update already cloned"
	-git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build || echo "ruby-build already cloned"
	-git clone https://github.com/pyenv/pyenv.git ~/.pyenv

upgrade-env-managers: ## Upgrade env managers
	-git -C ${NODENV_ROOT}/plugins/node-build pull
	-git -C ${RBENV_ROOT}/plugins/ruby-build pull

vim-install-nix:
	mkdir -p ${HOME}/.config
	ln -s ${HOME}/dev/dotfiles/vim-config ${HOME}/.config/nvim

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

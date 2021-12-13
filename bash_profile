if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

if [ "$(uname)" != "Darwin" ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source ~/.aliases
source ~/.exports
source ~/.functions

eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(direnv hook bash)"
eval "$(pyenv init -)"


# `brew install bash-completion`

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
	. `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
	. `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

[[ -f ~/.bash_local ]] && source ~/.bash_local
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

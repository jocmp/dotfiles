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

eval "$(direnv hook bash)"

export PATH="$PYENV_ROOT/bin:$PATH"

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
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"

. "/opt/homebrew/opt/asdf/libexec/asdf.sh"

. "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash"

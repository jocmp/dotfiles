export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="$HOME/.cargo/bin:$PATH"

if [ "$(uname)" != "Darwin" ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source ~/.aliases
source ~/.exports
source ~/.functions

eval "$(direnv hook bash)"
eval "$(pyenv init --path)"

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


if [ "$(uname)" == "Darwin" ]; then
  . "${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh"
fi

if [ -f "${HOMEBREW_PREFIX}/opt/asdf/etc/bash_completion.d/asdf" ]; then
  source "${HOMEBREW_PREFIX}/opt/asdf/etc/bash_completion.d/asdf"
fi

if [ -f "${HOMEBREW_PREFIX}/opt/asdf/etc/bash_completion.d/asdf.bash" ]; then
  source "${HOMEBREW_PREFIX}/opt/asdf/etc/bash_completion.d/asdf.bash"
fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jocmp/.lmstudio/bin"
# End of LM Studio CLI section

eval "$(~/.local/bin/mise activate bash)"
# eval "$(nodenv init - bash)"


# Bracketed paste
printf '\e[?2004l'

eval "$(zellij setup --generate-auto-start bash)"

#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Zsh options.
setopt extended_glob

# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/getantidote/antidote ${ZDOTDIR:-~}/.antidote

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

autoload -Uz compinit && compinit

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

export GPG_TTY=$(tty)

PATH=${PATH}:/home/gebhagr/.local/bin
PATH=${PATH}:/usr/local/go/bin
PATH=${PATH}:/home/gebhagr/go/bin
PATH=${PATH}:${KREW_ROOT:-$HOME/.krew}/bin

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# fuzzy finder stuff with ripgrep
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

#!/bin/zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

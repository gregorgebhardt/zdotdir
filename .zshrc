#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Uncomment to auto-start zellij on new terminals:
# if [[ -z "$ZELLIJ" ]] && [[ -n "$PS1" ]]; then
#   exec zellij
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of .zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh options.
setopt extended_glob

# Autoload functions.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Docker CLI completions — must be before compinit
fpath=($HOME/.docker/completions $fpath)

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/getantidote/antidote ${ZDOTDIR:-~}/.antidote

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load
[[ -r $ZDOTDIR/.zsh_plugins.local.txt ]] && antidote load $ZDOTDIR/.zsh_plugins.local.txt

autoload -Uz compinit && compinit

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# Source modular config files.
for _rc in ${ZDOTDIR}/.zshrc.d/*.zsh; do
  [[ $_rc:t != '~'* ]] && source "$_rc"
done
unset _rc

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source ${ZDOTDIR:-$HOME}/.p10k.zsh

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# >>>> BEGIN MANAGED DEVIN BLOCK >>>>
# Add ~/.local/bin to PATH for devin
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
# <<<< END MANAGED DEVIN BLOCK <<<<

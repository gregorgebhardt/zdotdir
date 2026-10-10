#!/bin/zsh
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

export AIKIDO_SCAN_TIMEOUT_MS=30000
[[ -r ~/.safe-chain/scripts/init-posix.sh ]] && source ~/.safe-chain/scripts/init-posix.sh

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

export DIRENV_LOG_FORMAT=
if command -v direnv >/dev/null 2>&1; then eval "$(direnv hook zsh)"; fi

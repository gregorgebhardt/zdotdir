#!/bin/zsh
#
# .aliases - Set whatever shell aliases you want.
#

# single character aliases - be sparing!
alias _=sudo
alias g=git

# mask built-ins with better defaults
alias vi=vim

# more ways to ls
alias ls='lsd'
alias l='ls -l'
alias ll='ls -lh'
alias la='ls -lAh'
alias ldot='ls -ld .*'
alias lt='ls --tree'

# fix common typos
alias quit='exit'
alias cd..='cd ..'

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# url encode/decode
alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

# misc
alias please=sudo
alias zshrc='${EDITOR:-nvim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'

# kubectl
alias kubectx='kubectl ctx'
alias kubens='kubectl ns'

# own stuff
fcd() { 
  cd $(find . -type d | fzf -q "${1:-}")
}

# lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -la'
alias lt='ls --tree'

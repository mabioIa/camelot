export ZSH="$HOME/.oh-my-zsh"
export LESS_TERMCAP_mb=$'\E[01;35m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export HISTCONTROL="ignoreboth"
export HISTFILESIZE=500
export HISTIGNORE="cd:..*:no:na:clear:reset:j *:exit:hc:h:-"

export PATH="$HOME/.emacs.d/bin:$PATH"

export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
export ETH_FROM=0x0000237A3D0AAD3CdA4D08707D2347605B9EaAAA
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_GB.UTF-8
export ARCHFLAGS="-arch ARM64"

alias ls="lsd"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

ZSH_THEME="robbyrussell"
. "$HOME/.linuxify"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

ph() { pushd "$1" 1>/dev/null && ls; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

mark() { 
  pandoc -s -f markdown -t man "$1" | groff -Tutf8 -man -Wall | less
}

alias icloud="$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs/"
alias arx="arxiv-downloader --url"
alias cpp="g++ -std=c++17 -Wall -Wextra -Wpedantic "
alias c="gcc -Wall -Wextra -Wpedantic "

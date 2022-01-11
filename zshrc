. ~/.linuxify

export ZSH="/Users/m/.oh-my-zsh"
ZSH_THEME="robbyrussell"
export PATH=".emacs.d/bin:$PATH"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_GB.UTF-8
export ARCHFLAGS="-arch ARM64"

alias ls="lsd"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

## Git shortcuts
alias a='git add'
alias p='git push origin main'
alias pu='git pull origin main'
alias d='git diff'
alias dc='git diff --cached'
alias ai='git add -i'
alias aip='git add -i -p'
alias pb='git pull --rebase origin master'
alias gpo='git push origin'
alias gpuo='git pull origin'
alias gp='git push'
alias gpu='git pull'
alias gpur='ls | xargs -I{} git -C {} pull '
alias gsu='git stash; git svn rebase; git stash pop &> /dev/null; git status -uno'
alias gsf='git svn fetch'
alias gsp='git stash; git svn dcommit; git stash pop &> /dev/null;'
alias gs='git status -uno'
alias gst='git status'
alias gpm='git submodule foreach git pull origin master'
alias sd='svn diff | vim -'
alias spu='svn up'
alias sp='svn ci'
alias gl='git log --stat -n30'

alias clone="git clone"

alias nig="npm install --global"
# Commit everything or specified path
c() {
    opts="-s"
    if [[ -f ".no_signoff" ]]; then
        opts=""
    fi;

    if [[ "$1" == "-i" ]]; then
        shift; git commit $opts --interactive $@
    else
        if [[ -n "$@" ]]; then
            git commit $opts $@
        else
            git commit $opts -a
        fi;
    fi;
}
alias ci='c -i';

# Show diff for a particular commit
dn() {
    if [[ "$1" == "" ]]; then
        git diff HEAD~..HEAD
    else
        git diff $1~..$1
    fi
}

# Git show relevant status
sa() {
    git status | ack -B 999 --no-color "Untracked"
}

alias h='builtin cd'
hc() { builtin cd; clear; }
mcd() { mkdir -p "$1" && eval cd "$1"; }

# Directory up
..() { cd "../$@"; }
..2() { cd "../../$@"; }
..3() { cd "../../../$@"; }
..4() { cd "../../../../$@"; }
..5() { cd "../../../../../$@"; }

# Ls after CD
cd() { if [[ -n "$1" ]]; then builtin cd "$1" && ls;
                         else builtin cd && ls; fi; }
,cd() { [[ -n "$1" ]] && builtin cd "$1" || builtin cd; }
ca() { ,cd "$1"; ls -la; }
cn() { ,cd "$1"; ls -a; }

# Directory stack
di() { dirs -v; }
po() { if [[ -n "$1" ]]; then popd "$1" 1>/dev/null && ls;
                         else popd 1>/dev/null && ls; fi; }
ph() { pushd "$1" 1>/dev/null && ls; }

# History control
export HISTCONTROL="ignoreboth"
export HISTFILESIZE=500
export HISTIGNORE="cd:..*:no:na:clear:reset:j *:exit:hc:h:-"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias m="neomutt"
mark() { 
  pandoc -s -f markdown -t man "$1" | groff -Tutf8 -man -Wall | less
}

# LESS termcap
export LESS_TERMCAP_mb=$'\E[01;35m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export HOMEBREW_INSTALL_BADGE="⚡️"
export INFURA_API_KEY=82e8bcc692bb4a91969669c1a2da0e45
export ETH_RPC_URL=https://mainnet.infura.io/v3/82e8bcc692bb4a91969669c1a2da0e45
export ETH_FROM=0x0000237A3D0AAD3CdA4D08707D2347605B9EaAAA
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"

alias icloud="/Users/m/Library/Mobile\ Documents/com\~apple\~CloudDocs/"
alias arx="arxiv-downloader --url"

# todo - devtodo

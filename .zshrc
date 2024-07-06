#!/bin/zsh
unsetopt BEEP
source ~/.zsh/z.sh

autoload -Uz vcs_info    
setopt prompt_subst    

zstyle ':vcs_info:*' formats "%F{red}[%b]%f"    
zstyle ':vcs_info:*' actionformats '%F{red}[%b](%a)%f'

# プロンプト表示直前にvcs_info呼び出し    
precmd(){
    _z --add "$(pwd -P)"
     vcs_info
}


bindkey -e
bindkey '^[[3~' delete-char

autoload -U promptinit
promptinit

prompt_gentoo_setup () {
    prompt_gentoo_prompt=${1:-'blue'}
    prompt_gentoo_user=${2:-'green'}
    prompt_gentoo_root=${3:-'red'}
    
    if [ "$USER" = 'root' ]
    then
    base_prompt="%B%F{$prompt_gentoo_root}%m%k "
    else
    base_prompt="%B%F{$prompt_gentoo_user}%n@%m%k "
    fi
    post_prompt='%b%f%k'
    
    #setopt noxtrace localoptions
    
    path_prompt="%B%F{$prompt_gentoo_prompt}%1~ "'${vcs_info_msg_0_}'
    PS1="$base_prompt$path_prompt %F{$prompt_gentoo_prompt}%# $post_prompt"
    PS2="$base_prompt$path_prompt %F{$prompt_gentoo_prompt}%_> $post_prompt"
    PS3="$base_prompt$path_prompt %F{$prompt_gentoo_prompt}?# $post_prompt"
}

prompt_gentoo_setup "$@"

autoload -Uz compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
# setopt correctall
export EDITOR="vim"
compinit
export HISTCONTROL=ignoreboth


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PATH=$PATH:/mnt/c/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.nodenv/bin
export PATH=$PATH:"/mnt/c/Windows/System32/"
export PATH=$PATH:"/mnt/c/Windows/System32/WindowsPowerShell/v1.0/"


# no expnad glob symboles
setopt nonomatch
export GIT_EDITOR=vim
alias explorer='/mnt/c/Windows/explorer.exe'
alias cmd='/mnt/c/Windows/System32/cmd.exe'
alias gvim='nvim-qt.exe'
alias gs='git status'

function git-vimdiff() {
    filename=$1
    c1=${2:-origin/master}
    c2=${3:-HEAD}
    vimdiff <(git show $(git merge-base $c1 $c2):$filename) <(git show $c2:filename)
}


setopt auto_cd
setopt auto_pushd
# setopt correct
setopt auto_list
setopt list_types

setopt extended_glob

alias pwsh='/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
alias p='pwsh -Command'
alias ls=' ls --color=always'
export LESS='-R'
alias -g L='| less -R'
alias -g terminal='terminal'
alias vim=nvim
alias view='nvim -n'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
stty -ixon

[ -f "/home/meiji/.ghcup/env" ] && source "/home/meiji/.ghcup/env" # ghcup-env

# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

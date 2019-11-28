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


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/bin/zbar
export PATH=$PATH:$NDK
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH=$PATH:/mingw64/bin/
export PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin
export PATH=$PATH:"/c/ProgramData/Microsoft/Windows/Start Menu/Programs/"
export PATH="$HOME/.nodenv/bin:$PATH"

# no expnad glob symboles
setopt nonomatch
export GIT_EDITOR=vim
alias tig='tig --all'
alias aps='aptitude search'
alias api='aptitude install'

setopt auto_cd
setopt auto_pushd
# setopt correct
setopt auto_list
setopt list_types

setopt extended_glob

alias powershell='/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
alias ls=' ls --color=always'
export LESS='-R'
alias -g L='| less -R'
alias -g terminal='terminal'

eval "$(nodenv init -)"


[ -s "/home/ggkuron/.dnx/dnvm/dnvm.sh" ] && . "/home/ggkuron/.dnx/dnvm/dnvm.sh" # Load dnvm

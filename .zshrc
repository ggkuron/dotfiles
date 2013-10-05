#!/bin/zsh

export PATH=$PATH:$HOME/.cabal/bin
if [ $TTY = "/dev/tty1" ] ; then
    exec startx
fi
source ~/.zsh/z.sh
precmd(){
    _z --add "$(pwd -P)"
}

# countermeasure against "function definition file not found"
# fpath=(/usr/local/share/zsh/5.0.2/functions ${fpath})

bindkey '^[[3~' delete-char

autoload -U promptinit
promptinit
prompt gentoo

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

export GBDKDIR=/usr/local/share/gbdk/
export HAXEPATH=/usr/local/haxe
# tail :. is important
export HAXE_STD_PATH=/usr/local/haxe/std:.
export NEKOPATH=/usr/local/neko
export DART_SDK=$HOME/dart/dart/dart-sdk
export NDK=$HOME/android-ndk-r8e
export GEM_HOME=$HOME/.gem/ruby/2.0.0/gems

export PATH=$PATH:/usr/lib/ccache/bin:/usr/lib/distcc/bin
export PATH=$PATH:/usr/games/bin
export PATH=$PATH:$GBDKDIR/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/altera/12.0sp1/quartus/bin
export PATH=$PATH:$HOME/android/android-sdk-linux/tools
export PATH=$PATH:$HOME/android/android-sdk-linux/platform-tools
export PATH=$PATH:$NDK
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH=$PATH:$NEKOPATH
export PATH=$PATH:$HAXEPATH
export PATH=$PATH:$HAXEPATH/std
export PATH=$PATH:$DART_SDK
export PATH=$PATH:$DART_SDK/bin
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/gems/bin
export PATH=$PATH:$HOME/cabal-dev/yesod/bin
export PATH=$PATH:$HOME/groovy-2.1.6/bin
export PATH=$PATH:$HOME/mikutter
export PATH=$PATH:$HOME/workspace/Haskell/yesod/cabal-dev/bin

# no expnad glob symboles
setopt nonomatch
export GIT_EDITOR=vim
alias tig='tig --all'

setopt auto_cd
setopt auto_pushd
# setopt correct
setopt auto_list
setopt list_types

setopt extended_glob

alias ls=' ls --color=always'
export LESS='-R'
alias -g L='| less -R'
alias -g terminal='terminal'

alias hdmil='monitrc hdmi-left'
alias hdmir='monitrc hdmi-right'
alias hdmim='monitrc hdmi-mirror'
alias hdmioff='monitrc hdmi-off'

#THIS MUST BE AT THE END FOR GVM TO WORK!!!
[[ -s $HOME/.gvm/bin/gvm-init.sh ]] && source $HOME/.gvm/bin/gvm-init.sh

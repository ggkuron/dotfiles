#!/bin/sh

. $PWD/setup_common.sh

git clone git://github.com/rupa/z $HOME/.zsh

sym_to_home .bashrc
sym_to_home .zshrc
sym_to_home .vimrc
sym_to_home .gvimrc
sym_to_home .tmux.conf
sym_to_home .xmodmap
sym_to_home .caps_killer
sym_to_home .ghci

if mkdir_if_needed .config/Terminal ; then
    sym_to_home .config/Terminal/terminalrc
fi
if mkdir_if_needed scripts ; then
    for f in scripts/* ; do
        sym_to_home $f
    done
fi

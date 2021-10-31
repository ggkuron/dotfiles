#!/bin/bash

. $PWD/setup_common.sh

git clone git://github.com/rupa/z $HOME/.zsh
# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein && rm ./installer.sh
# create a directory for vim persistent undo 
mkdir -p ~/.vim/undo

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

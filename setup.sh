#!/bin/sh

. $PWD/setup_common.sh

sym_to_home .bash_profile
sym_to_home .bashrc
sym_to_home .zshrc
sym_to_home .vimrc
sym_to_home .gvimrc
sym_to_home .tmux.conf

if mkdir_if_needed .config/Terminal; then
	sym_to_home .config/Terminal/terminalrc
fi

#!/bin/sh

. $PWD/setup_common.sh

sym_to_home .xinitrc
sym_to_home .xmodmap
sym_to_home .xmobarrc

if mkdir_if_needed .xmonad; then
	sym_to_home .xmonad/xmonad.hs
fi

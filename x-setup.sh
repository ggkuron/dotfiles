#!/bin/sh

. $PWD/setup_common.sh

sym_to_home .xprofile
sym_to_home .xinitrc
sym_to_home .xmodmap
sym_to_home .xmobarrc
sym_to_home .vimperatorrc
sym_to_home fonts-lcd.conf
sym_to_home .xkb

if mkdir_if_needed .xmonad ; then
    sym_to_home .xmonad/xmonad.hs
fi

if mkdir_if_needed .gconf/apps ; then
    sym_to_home .gconf/apps/gnome-terminal
fi

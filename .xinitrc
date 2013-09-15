# # bellow exports were moved to xprofile
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# #
ibus-daemon -d -x
gnome-power-manager&

# set left of A Ctrl, and change Mod key
xmodmap -e "keycode 108 = Alt_L"    
xmodmap ~/.xmodmap

# for xmonad
xsetroot -cursor_name left_ptr
xmonad
xfsettingsd&
hsetroot -fill $HOME/Desktop/cartridge_dig.png

# exec /usr/bin/awesome
exec $HOME/altera/12.0sp1/quartus/bin/jtagd

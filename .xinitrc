# # bellow exports were moved to xprofile
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# #
ibus-daemon -d -x
ssh-agent 
gnome-power-manager&

# replace Capslock with Ctrl_L
# xmodmap ~/.caps_killer
# setxkbmap -option ctrl:nocaps
# xmodmap ~/.xmodmap

# for xmonad
hsetroot -fill $HOME/Desktop/cartridge_dig.png
xsetroot -cursor_name left_ptr
xmonad

#exec /usr/bin/awesome
exec $HOME/altera/12.0sp1/quartus/bin/jtagd

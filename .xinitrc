export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -d -x

# for font hinting
gnome-power-manager&

# set left of A Ctrl, and change Mod key
xmodmap -e "keycode 108 = Alt_L"    
xmodmap ~/.xmodmap

xfsettingsd
# for xmonad
xsetroot -cursor_name left_ptr
xmonad


# exec /usr/bin/awesome
exec /home/ggkuron/altera/12.0sp1/quartus/bin/jtagd

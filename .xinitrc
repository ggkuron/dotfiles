# # bellow exports were moved to xprofile
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
ibus-daemon -d -x
ssh-agent 
gnome-power-manager&

# for xmonad
hsetroot -fill $HOME/Desktop/cartridge_dig.png
xsetroot -cursor_name left_ptr
xmonad
xmodmap ~/.change_alt

# replace Capslock with Ctrl_L
# xmodmap ~/.caps_killer
# setxkbmap -option ctrl:nocaps
# xmodmap ~/.xmodmap
# 最初の一度だけ、bluetooth keyboardなどは影響を受けない
#xmodmap -e "remove mod1 = Alt_L"
#xmodmap -e "remove mod4 = Super_L"
#xmodmap -e "add mod1 = Super_L"
#xmodmap -e "add mod4 = Alt_L"


#exec /usr/bin/awesome
exec $HOME/altera/12.0sp1/quartus/bin/jtagd

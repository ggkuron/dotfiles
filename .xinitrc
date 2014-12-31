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

exec xmonad

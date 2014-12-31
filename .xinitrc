# # bellow exports were moved to xprofile
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
ibus-daemon -d -x
ssh-agent 

# for xmonad
hsetroot -fill $HOME/Desktop/Abstract-Retro.jpg
xsetroot -cursor_name left_ptr
if [ -x /usr/bin/gnome-power-manager] ; then
    gnome-power-manager&
fi

exec xmonad

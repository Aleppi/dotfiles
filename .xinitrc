[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd --quiet --opendisplay --fork
setxkbmap -model pc105 -layout se,jp -option grp:sclk_toggle,grp_led:scroll
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xmodmap ~/.Xmodmap
xset +fp /home/aleppi/.fonts
xset fp rehash
#wal -R
xrdb ~/.Xresources
mpd &
xrandr --setprovideroffloadsink nouveau Intel
xinput --disable "14"
xinput --disable "10"
#exec bspwm
exec dbus-launch --exit-with-session bspwm

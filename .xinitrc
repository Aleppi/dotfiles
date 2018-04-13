[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd --quiet --opendisplay --fork
setxkbmap -model pc105 -layout jp,se -option grp:sclk_toggle,grp_led:scroll
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xset +fp /home/aleppi/.fonts
xset fp rehash
#wal -R
xrdb ~/.Xresources
exec bspwm

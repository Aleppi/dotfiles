#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export GI_TYPELIB_PATH=/usr/lib/girepository-1.0

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

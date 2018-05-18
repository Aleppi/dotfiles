#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="firefox"

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

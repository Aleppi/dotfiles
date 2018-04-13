# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aleppi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $HOME/.aliases

PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH
export PS1="[%n@%M]:%~ "

(cat ~/.cache/wal/sequences &)

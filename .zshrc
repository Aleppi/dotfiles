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

export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/share/nvim/plugged/vim-live-latex-preview/bin"
export PS1="[%n@%M]:%~ "

(cat ~/.cache/wal/sequences &)

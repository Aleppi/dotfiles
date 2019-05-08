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
source $HOME/.variables
source /etc/profile
#export PS1="[%n@%M]:%~ "
export PATH="${PATH}:/usr/bin:${HOME}/.local/bin:${HOME}/.local/share/nvim/plugged/vim-live-latex-preview/bin:${HOME}/.scripts"
export PATH="$PATH:/opt/texlive/2018/bin/x86_64-linux"
export PS1="%B%{$(tput setaf 1)%}[%{$(tput setaf 5)%}%n%{$(tput setaf 1)%}@%{$(tput setaf 6)%}%M%{$(tput setaf 1)%}]%b%{$(tput setaf 7)%}:%B%{$(tput setaf 4)%}%~ %b%{$(tput setaf 7)%}"

ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

(cat ~/.cache/wal/sequences &)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aleppi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aleppi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aleppi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aleppi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


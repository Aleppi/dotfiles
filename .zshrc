# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/aleppi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

source $HOME/.aliases
source $HOME/.variables
source /etc/profile
#export PS1="[%n@%M]:%~ "

export GPG_TTY=$(tty)

#export GNUBINS="$(find /usr/local/opt -type d -follow -name gnubin -print)";

#for bindir in ${GNUBINS[@]}; do
#  export PATH=$bindir:$PATH;
#done;

export PATH="/usr/local/bin:$PATH:${HOME}/.local/bin:${HOME}/.local/share/nvim/plugged/vim-live-latex-preview/bin:${HOME}/.scripts:/usr/local/texlive/2020/bin/x86_64-darwin:${HOME}/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin"
export PS1="%B%{$(tput setaf 1)%}[%{$(tput setaf 5)%}%n%{$(tput setaf 1)%}@%{$(tput setaf 6)%}%M%{$(tput setaf 1)%}]%b%{$(tput setaf 7)%}:%B%{$(tput setaf 4)%}%~ %b%{$(tput setaf 7)%}"
export MANPATH="/usr/local/texlive/2020/texmf-dist/doc/man"
export INFOPATH="/usr/local/texlive/2020/texmf-dist/doc/info"
export VISUAL=nvim
export EDITOR=nvim


ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/local/bin/ranger "$@"
    else
        exit
    fi
}

#(cat ~/.cache/wal/sequences &)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

fpath+=${ZDOTDIR:-~}/.zsh_functions
#eval "$(starship init zsh)"

# SSH alias for kitty
if [ "$TERM" = "xterm-kitty" ]; then
    alias ssh="kitty +kitten ssh"
fi

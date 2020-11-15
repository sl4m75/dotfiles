[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
alias \
        cp="cp -iv" \
        mv="mv -iv" \
        rm="rm -v" \
        mkd="mkdir -pv" \
        v="vim" \
        ls="ls -hN --color=auto --group-directories-first" \
        la="ls -a --color=auto" \
        ll="ls -lh --color=auto" \
        grep="grep --color=auto" \
        diff="diff --color=auto" \
ex () {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.lzma)      unlzma $1      ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x -ad $1 ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
 fi
}    

export HISTSIZE= HISTFILESIZE=10000
export EDITOR=/bin/vim
export QT_QPA_PLATFORMTHEME=qt5ct
export LC_ALL=en_US.UTF-8
export PS1="\[\033[38;5;92m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;27m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;122m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]:ֆ \[$(tput sgr0)\]"


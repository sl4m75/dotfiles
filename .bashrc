[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

alias \
        cp="cp -iv" \
        mv="mv -iv" \
        rm="trash-put -iv" \
        mkd="mkdir -pv" \
        cat="bat --theme Dracula" \
        v="vim" \
        ka="killall" \
        cl="clear" \
        ls="ls -hN --color=auto --group-directories-first" \
        lo="libreoffice" \
        lw="librewolf" \
        ffp="librewolf --no-remote --ProfileManager" \
        weather="curl https://www.wttr.in/Istanbul" \
        ftphone="lftp 192.168.1.27:2121 -u admin" \
        http="sudo python3 -m http.server 80" \
        py="python" \
        sx="sxiv" \
        myip="~/Documents/scripts/myip.sh" \
        dl="youtube-dl --restrict-filenames" \
        gt="gotop -c vice -s -a" \
        gst="git status"\
        neofetch="neofetch --refresh_rate on " \
        la="ls -a --color=auto" \
        ll="ls -lh --color=auto" \
        update="sudo pacman -Syu" \
        grep="grep -i --color=auto" \
        egrep="egrep -i --color=auto" \
        feh="feh --auto-rotate" \
        diff="diff --color=auto" \
        findp="ps aux |grep -i $1" \
        sfu="cd ~/Programming/web/sfu && node app.js & disown" \

shopt -s autocd

#set -o vi

batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}

n () {
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn -Udxe "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

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
# Color for man pages, less ...
#export LESS_TERMCAP_mb=$'\e[1;32m'
#export LESS_TERMCAP_md=$'\e[1;32m'
#export LESS_TERMCAP_me=$'\e[0m'
#export LESS_TERMCAP_se=$'\e[0m'
#export LESS_TERMCAP_so=$'\e[01;33m'
#export LESS_TERMCAP_ue=$'\e[0m'
#export LESS_TERMCAP_us=$'\e[1;4;31m'

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export _JAVA_AWT_WM_NONREPARENTING=1
export HISTSIZE= HISTFILESIZE=50000
export HISTCONTROL=ignorespace
export LESSHISTFILE=/dev/null
export EDITOR=/bin/vim
export QT_QPA_PLATFORMTHEME=qt5ct
export LC_ALL=en_US.UTF-8 
#export LC_ADDRESS=en_US.UTF-8

#nnn config
export NNN_COLORS="5136"
export NNN_PLUG='v:imgview;f:fzcd;b:setbg;p:preview-tabbed;g:bookmarks;c:cleanfilename'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_FCOLORS='c1e2812e006033f7c6d6abc4'
export NNN_TRASH=1
###
export CM_IGNORE_WINDOW="[kK]ee[pP]ass"

#ask for sudo passwd using dmenu with password patch
export SUDO_ASKPASS=/home/sl4m/Documents/scripts/askpass.sh

export PS1="\[\033[38;5;92m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;27m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;122m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]:ֆ \[$(tput sgr0)\]"

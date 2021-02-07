#tets
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

alias \
        cp="cp -iv" \
        mv="mv -iv" \
        rm="rm -v" \
        mkd="mkdir -pv" \
        v="vim" \
        ka="killall" \
        cl="clear" \
        ls="ls -hN --color=auto --group-directories-first" \
        lo="libreoffice" \
        lw="librewolf" \
        ffp="librewolf --no-remote --ProfileManager" \
        weather="curl wttr.in/Istanbul" \
        vpn="sudo openvpn ~/metrovpn.ovpn & disown" \
        py="python" \
        myip="~/Documents/scripts/myip.sh" \
        dl="youtube-dl" \
        gotop="gotop -c vice -s -a" \
        surf="tabbed -r 2 surf -pe x 'https://duckduckgo.com' " \
        gst="git status"\
        neofetch="neofetch neofetch --ascii_distro tux --refresh_rate on" \
        less="LESSHISTFILE=/dev/null less" \
        la="ls -a --color=auto" \
        ll="ls -lh --color=auto" \
        update="sudo pacman -Syu" \
        gocrazy="ckb-next -m fulltilt && urxvt -tr -e curl parrot.live & disown & exit"\
        grep="grep -i --color=auto" \
        feh="feh --auto-rotate" \
        diff="diff --color=auto" \
        findp="ps aux |grep -i $1" \
        sfu="cd ~/programming/web/sfu && node app.js & disown" \
    sdn="shutdown -h now" 

alias mpv="mpv --volume=50 --screenshot-directory=$HOME/Pictures" 

shopt -s autocd
#set -o vi

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
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export _JAVA_AWT_WM_NONREPARENTING=1
export HISTSIZE= HISTFILESIZE=10000
export EDITOR=/bin/vim
export QT_QPA_PLATFORMTHEME=qt5ct
export LC_ALL=en_US.UTF-8 
#export LC_ADDRESS=en_US.UTF-8

export PS1="\[\033[38;5;92m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;27m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;122m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]:ֆ \[$(tput sgr0)\]"

export PATH=$PATH:/home/sl4m/programming/eclipse


alias dnf='dnf -x shim,mokutil'
alias yum='dnf -x shim,mokutil'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls='ls --color=auto'
alias ll='ls --color=auto -lh --group-directories-first'
alias lll='ls --color=auto -lhtr  --group-directories-first'

alias less='less -n'

alias tailf='tail -f'

alias wget='wget --content-disposition'
alias curl='curl -L'

alias 7z='7za'
alias 7za='7za a -ssw -snh'
alias 7zx='7za x'

alias dstart='docker start'
alias dstop='docker stop'
alias drestart='docker restart'

alias dlogs='docker logs'
alias dexec='docker exec -it'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

PS1="\[\e[37;40m\][\[\e[32;40m\]\u\[\e[37;40m\]@\h \[\e[36;40m\]\w\[\e[0m\]]\\$ "

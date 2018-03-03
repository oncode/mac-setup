#!/usr/bin/env bash

###############################################################################
# Bash Configuration
###############################################################################

# include modified version of bash powerline
source "$BASH_STUFF/mac-setup/vendor/bash-powerline/bash-powerline.sh"

# set default editor
export EDITOR=$(which slap)

# disables statistics that brew collects
export HOMEBREW_NO_ANALYTICS=1

# don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'

# aliases
alias ls='ls -FGlAhp'
alias la='exa -abghl --git'

alias c='clear'
alias h='history'
alias cd..='cd ..'
alias ..='cd ..'

alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'
alias rm='rm -i'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias now='date +"%T"'
alias nowdate='date +"%d.%m.%Y"'

alias f='open -a Finder ./'
alias edit='$EDITOR'
alias path='echo -e ${PATH//:/\\n}'
alias flushdns='dscacheutil -flushcache'
alias openports='sudo lsof -i | grep LISTEN'

alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias edithosts='sudo $EDITOR /etc/hosts'

alias glog="git log --oneline --decorate --all --graph"

# lock screen
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# find resource intensive processes
alias cpuhogs='top -R -F -s 1 -o cpu'
alias memhogs='top -R -F -s 1 -o rsize'

# list processes owned by current user
myps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# search for file using spotlight metadata
spotlight() { mdfind "kMDItemDisplayName == '$@'wc"; }

# count files
alias nf='echo $(ls -1 | wc -l)'

# always list directory contents upon 'cd'
cd() { builtin cd "$@"; la; } 

# makes new directory and jumps inside
mc() { mkdir -p "$1" && cd "$1"; }

# opens any file in MacOS Quicklook Preview
ql() { qlmanage -p "$*" >& /dev/null; }

# zip folder
zipf() { zip -r "$1".zip "$1" ; }

# upload files
transfer() {
    tmpfile=$( mktemp -t transferXXX )
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
}

alias transfer=transfer

 extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
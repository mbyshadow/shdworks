## Shadow idk memory bad
##   confidante
##   mbyshadow@protonmail.com

[ -z "$PS1" ] && return

##  Source global definitions
##======================================================
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

## this is the way
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
if [ -f ~/.bash_styles ]; then
    . ~/.bash_styles
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


## check the window size after each command and, if necessary,## update the values of LINES and COLUMNS.
shopt -s checkwinsize
## cd when entering just a path in the shell
shopt -s autocd

##	bash_history
##======================================================

## don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

##append to the history file, don't overwrite it
shopt -s histappend

## history length
HISTSIZE=1000
HISTFILESIZE=2000

##
##======================================================

[[ $(declare -p PS1 2>/dev/null | cut -c 1-11) = 'declare -x ' ]] || \
  export PS1='\[\e]0;\w\a\]\n\[\e[33m\][\h] \[\033[00m\]\w\n\[\033[01;34m\]\$\[\033[00m\]: '


##  Color
##======================================================
# enable color support of ls, grep, ip.
if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ip='ip --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto -h'
fi


## ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
#export LESS="-iMFXR"

##make less more friendly for non-text input files, see lesspipe(1)
#[ -x usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

##  man in color
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


## Private alias
##======================================================

## try exa
if [ -n "$(command -v exa)" ]; then
  alias l='exa'
  alias ls='exa'
  alias ll='exa -hl'
  alias la='exa -ha'
  alias lla='exa -hla'
else
   alias l='ls -h'
   alias ll='ls -lh'
   alias la='ls -ah'
   alias lla='ls -lah'
fi

alias du='du -kh'

# we need this..
alias rm='rm -vi'
alias cp='cp -vi'
alias ln='ln -vi'
alias mv='mv -vi'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

## spelling..
alias l..='ls ..'
alias cd..='cd ..'


##-----------------------------------------------------

#alias l='ls -h'
#alias ll='ls -lh'
#alias la='ls -ah'
#alias lla='ls -lah'

alias mkdir='mkdir -p -v'

alias apt='sudo apt'
alias update='apt update && apt list --upgradable'
alias upgrade='apt upgrade'

##  Private functions
##======================================================

## extract
extract () {
 if [ -f $1 ] ; then
   case $1 in
       *.tar.bz2)   tar xvjf $1    ;;
       *.tar.gz)    tar xvzf $1    ;;
       *.bz2)       bunzip2 $1     ;;
       *.rar)       unrar x $1     ;;
       *.gz)        gunzip $1      ;;
       *.tar)       tar xvf $1     ;;
       *.tbz2)      tar xvjf $1    ;;
       *.tgz)       tar xvzf $1    ;;
       *.zip)       unzip $1       ;;
       *.Z)         uncompress $1  ;;
       *.7z)        7z x $1        ;;
       *)           echo "don't know how to extract '$1'..." ;;
    esac
 else
  echo "'$1' is not a valid file!"
 fi
 }

##======================================================


## netinfo - shows network information for your system
#netinfo () {
#  echo "--------------- Network Information ---------------"
#  /sbin/ifconfig eth0 | grep 'inet' | cut -d: -f2 | awk '{print $2}'
#  /sbin/ifconfig eth0 | grep 'broadcast' | awk '{print $4}'
#  /sbin/ifconfig | awk /'inet addr/ {print $4}'
#  /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
#  myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
#  echo "${myip}"
#  echo "---------------------------------------------------"
#}


## enable programmable completion features.
## should already be enabled somewhere, /etc/bash.bashrc, /etc/profile, /etc/bash.bashrc.
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

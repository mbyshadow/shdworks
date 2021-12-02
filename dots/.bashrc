
## Shadow idk memory bad
##   confidante
##   mbyshadow@protonmail.com


## If not running interactively, don't do anything..
case $- in
    *i*)
	;;
 	*) return
;;
esac

##  Source global definitions
##======================================================

if [ -f /etc/bashrc ]; then
  ./etc/bashrc   # --> Read /etc/bashrc, if present.
fi
#~/.bash_allias
#~/.bash_functions
#~/.bash_style


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
	export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]BASH\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n'"$"' '

date
echo -e "This is BASH ${BASH_VERSION%.*} on DISPLAY$DISPLAY"


##  Color
##======================================================
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

## ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export LESS="-iMFXR"

##  man in color
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## Private alias
##======================================================
alias du='du -kh'

## we need this..
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

## colored output
##-----------------------------------------------------

## try exa
if [ -n "$(command -v exa)" ]; then
	alias l='exa'
	alias ls='exa'
	alias ll='exa -hl'
	alias la='exa -ha'
	alias lla='exa -hla'
else
	alias l='ls -h --color=auto'
	alias ls='ls -h --color=auto'
	alias ll='ls -lh  --color=auto'
	alias la='ls -ah --color=auto'
	alias lla='ls -lah --color=auto'
fi

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto -h'

update='sudo apt update && apt list --upgradable'
upgrade='sudo apt update'

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


##
##======================================================

#alias install='sudo pacman -Syu'
#alias remove='sudo pacman -R'
#alias purge='sudo pacman -Rsuvc'
#alias update='sudo pacman -Syy'
#alias upgrade='sudo pacman -Suv'
## netinfo - shows network information for your system
  netinfo () {
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    /sbin/ifconfig | awk /'inet addr/ {print $4}'
    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
    echo "${myip}"
    echo "---------------------------------------------------"
}



## enable programmable completion features.
## should already be enabled somewhere, /etc/bash.bashrc, /etc/profile, /etc/bash.bashrc.
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

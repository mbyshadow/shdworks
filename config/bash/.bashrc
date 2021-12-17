## Shadow idk memory bad
##   confidante
##   mbyshadow@protonmail.com

[ -z "$PS1" ] && return

##  Source global definitions
##======================================================
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
if [ -f ~/.bash_styles ]; then
    . ~/.bash_styles
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi


## check the window size after each command and, if necessary,## update the values of LINES and COLUMNS.
shopt -s checkwinsize
## cd when entering just a path in the shell
shopt -s autocd ## fix/stop auto cd $env plz

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
  export PS1='\[\e]0;\w\a\]\n\[\033[38;5;12m\]#\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;6m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;8m\]@\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;2m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;8m\]in\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;8m\][\A]\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[\033[38;5;1m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;11m\]'



## netinfo - shows network information for your system
## netinfo () {
#  echo "--------------- Network Information ---------------"
#  /sbin/ifconfig eth0 | grep 'inet' | cut -d: -f2 | awk '{print $2}'
#  /sbin/ifconfig eth0 | grep 'broadcast' | awk '{print $4}'
#  /sbin/ifconfig | awk /'inet addr/ {print $4}'
#  /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
#  myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
#  echo "${myip}"
#  echo "---------------------------------------------------"
#

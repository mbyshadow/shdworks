#
# ~/.bash_functions
#

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

## enable programmable completion features.
## should already be enabled somewhere, /etc/bash.bashrc, /etc/profile, /etc/bash.bashrc.
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

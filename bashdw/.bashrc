
#Shadow idk memory bad
#   confidante
#   mbyshadow@protonmail.com


# If not runninig interactively, don't do anything
  [ -z "$PS1" ] && return


#  Source global definitions
# ======================================================|

   if [ -f /etc/bashrc ]; then
          ./etc/bashrc   # --> Read /etc/bashrc, if present.
   fi
# 	  ~/.bash_allias
#         ~/.bash_functions
#	  ~/.bash_style


# Private alias
# ======================================================|

# ls familia
# ------------------------------------------------------>
# Colors for filetype and human-readable, default

  alias ls='ls -h --color'

  alias l='ls'              # l  = list
  alias ll='ls -l'	    # ll = list long
  alias la='ls -a'
  alias lla='ls -a -l'

#alias lx='ls -lXB'         # sort by extension.
#alias lk='ls -lSr'         # size, biggest lasta
#alias lt='ls -ltr'         # date, most recent
#alias lc='ls -ltcr'        # show change time
#alias lu='ls -ltur'        # access time


# PATH
# ------------------------------------------------------>
# Pretty-print PATH variables:
  alias path='echo -e ${PATH//:/\\n}'
  alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


# cd
# ------------------------------------------------------>
  alias ..="cd .."
  alias ...="cd ../.."
  alias ....="cd ../../.."
  alias .....="cd ../../../.."

  alias cd..='cd ..'

# du
# ------------------------------------------------------>
  alias du='du -kh' #whynot


# spelling
# ------------------------------------------------------>

  alias l..='ls ..'


# Private functions
#=======================================================|

extract () {		#extract em
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



# Finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'

# ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export LESS="-iMFXR"

# man in color
  export LESS_TERMCAP_mb=$'\E[01;31m'
  export LESS_TERMCAP_md=$'\E[01;31m'
  export LESS_TERMCAP_me=$'\E[0m'
  export LESS_TERMCAP_se=$'\E[0m'
  export LESS_TERMCAP_so=$'\E[01;44;33m'
  export LESS_TERMCAP_ue=$'\E[0m'
  export LESS_TERMCAP_us=$'\E[01;32m'


# netinfo - shows network information for your system
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


  alias rm='rm -vi'
  alias cp='cp -vi'
  alias mv='mv -vi'
  alias install='sudo pacman -S'
  alias remove='sudo pacman -Rv'
  alias purge='sudo pacman -Rscuv'
  alias update='sudo pacman -Syy'
# alias sources='(gksudo gedit /etc/apt/sources.list &)'
# alias downloads='ls -ltrh /home/username/Downloads'

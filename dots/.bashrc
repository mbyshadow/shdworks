[ -z "$PS1" ] && return

## Shadow idk memory bad
##   confidante
##   mbyshadow@protonmail.com

##  Source global definitions
##|======================================================|

   if [ -f /etc/bashrc ]; then
          ./etc/bashrc   # --> Read /etc/bashrc, if present.
   fi
# 	  ~/.bash_allias
#       ~/.bash_functions
#	   ~/.bash_style



##  Color definitions
##|======================================================|
## Stolen @ taken from Color Bash Prompt HowTo).
## Colors might look different in other terminals

## Normal Colors
#Black='\e[0;30m'        # Black
#Red='\e[0;31m'          # Red
#Green='\e[0;32m'        # Green
#Yellow='\e[0;33m'       # Yellow
#Blue='\e[0;34m'         # Blue
#Purple='\e[0;35m'       # Purple
#Cyan='\e[0;36m'         # Cyan
#White='\e[0;37m'        # White

## Bold
#BBlack='\e[1;30m'       # Black
#BRed='\e[1;31m'         # Red
#BGreen='\e[1;32m'       # Green
#BYellow='\e[1;33m'      # Yellow
#BBlue='\e[1;34m'        # Blue
#BPurple='\e[1;35m'      # Purple
#BCyan='\e[1;36m'        # Cyan
#BWhite='\e[1;37m'       # White

## Background

#On_Black='\e[40m'       # Black
#On_Red='\e[41m'         # Red
#On_Green='\e[42m'       # Green
#On_Yellow='\e[43m'      # Yellow
#On_Blue='\e[44m'        # Blue
#On_Purple='\e[45m'      # Purple
#On_Cyan='\e[46m'        # Cyan
#On_White='\e[47m'       # White

#NC="\e[m"               # Color Reset


#ALERT=${BWhite}${On_Red} # Bold White on red background

#echo -e "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\
#- DISPLAY on ${BRed}$DISPLAY${NC}\n"
date


##  man in color
##>------------------------------------------------------<
## will still be diffrent in others
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


## Colored output
##>------------------------------------------------------<
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto -h'


## Private alias
##|======================================================|
alias du='du -kh'
## we need this..
alias rm='rm -vi'
alias cp='cp -vi'
alias ln='ln -vi'
alias mv='mv -vi'

## space on your in folders (or "drives")
alias diskspace="du -S | sort -n -r | less"

## ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export LESS="-iMFXR"

## Private alias, ls familia
##>------------------------------------------------------<

## Colors and human-readable
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

#alias lx='ls -lXB'         # sort by extension.
#alias lk='ls -lSr'         # size, biggest lasta
#alias lt='ls -ltr'         # date, most recent
#alias lc='ls -ltcr'        # show change time
#alias lu='ls -ltur'        # access time

## Private alias, path
##>------------------------------------------------------<
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


## Private alias, cd
##>------------------------------------------------------<
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


## Private alias,  spelling
##>------------------------------------------------------<
## be here mad

alias l..='ls ..'
alias cd..='cd ..'


##  Private functions
##|======================================================|

##  extreact ()
##>------------------------------------------------------<
## Stolen for generations

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


##  Arch conf.
##|======================================================|

alias install='sudo pacman -Syu'
alias remove='sudo pacman -R'
alias purge='sudo pacman -Rsuvc'
alias update='sudo pacman -Syy'
alias upgrade='sudo pacman -Suv'
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

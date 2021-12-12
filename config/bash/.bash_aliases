##
## ~/.bash_profile
##
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

##-----------------------------------------------------

#alias l='ls -h'
#alias ll='ls -lh'
#alias la='ls -ah'
#alias lla='ls -lah'

alias mkdir='mkdir -p -v'

#alias apt='sudo apt'
alias update='apt update && apt list --upgradable'
alias upgrade='apt upgrade'

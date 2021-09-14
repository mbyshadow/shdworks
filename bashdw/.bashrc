
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


# du
# ------------------------------------------------------>
  alias du='du -kh' #whynot


# spelling
# ------------------------------------------------------>

  alias cd..='cd ..'
  alias ..='cd ..'

  alias l..='ls ..'


# Private functions
#=======================================================|

#Processes---------------------------------------------->

# lol
# You deleted this, remember?

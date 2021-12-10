#
# ~/.bash_profile
#

echo 'start bash_profile'

## if running bash
#if [ -n "$BASH_VERSION" ]; then
    ## include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#        . "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi


##  Source global definitions
##======================================================

## this is the way


if [ -f ~/.bashrc ]; then
    . ~/.bashrc
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
#if [ -f ~/.git-prompt.sh ]; then
#    . ~/.git-prompt.sh
#fi
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi



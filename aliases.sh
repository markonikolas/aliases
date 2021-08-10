#!/bin/bash

########

## Default aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

## Color default aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -x ./default_aliases ]; then
    source default_aliases
fi

if [ -x ./docker_aliases ]; then
    source docker_aliases
fi

if [ -x ./git_aliases ]; then
    source git_aliases
fi



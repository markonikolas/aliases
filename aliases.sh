#!/bin/bash

########

## Default aliases
if [ -x ./default_aliases ]; then
    source default_aliases
fi

## Docker aliases
if [ -x ./docker_aliases ]; then
    source docker_aliases
fi

## Git aliases
if [ -x ./git_aliases ]; then
    source git_aliases
fi



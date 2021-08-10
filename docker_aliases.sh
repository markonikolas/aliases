#!/bin/bash

## Docker
alias docker='sudo docker'
alias dsp='docker stop'
alias dst='docker start'
alias dr='docker restart'

### Docker Volume
alias dv='docker volume'
alias dvl='dv ls'
alias dvp='dv prune'

### Docker Network
alias dn='docker network'
alias dnl='dn ls'
alias dnp='dn prune'

### Docker Images
alias di='docker images'
alias dil='di ls'
alias dirm='di rm'
alias dip='di prune'

### Docker All
alias dpa='dvp && dnp && dip'

## Docker Compose
alias docker-compose='sudo docker-compose'
alias dc='docker-compose'
alias dcu='dc up'
alias dcs='dc stop'
alias dcd='dc down'
alias dcb='dc build'
alias dcr='dc restart'
alias dcrm='dc rm'
alias dcre='dc rm $(docker ps -a -q --filter "status=exited")'

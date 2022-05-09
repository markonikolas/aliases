#!/bin/bash

## Docker
alias docker='sudo docker'
alias dsp='docker stop'
alias dst='docker start'
alias dr='docker restart'
alias drm='docker rm'
alias dps='docker ps'
alias dpsq='docker ps -q'
alias dstp='docker stop $(dpsq)'
alias drmall='docker rm $(dspq)'

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
alias dcu='dcpall; docker-compose up'
alias dcud='dcpall; docker-compose up -d'
alias dcs='docker-compose stop'
alias dcd='docker-compose down'
alias dcb='dcpall; docker-compose build'
alias dcr='docker-compose restart'
alias dcrm='dcpall; docker-compose rm'
alias dcre='docker-compose rm $(docker ps -a -q --filter "status=exited")'
alias dcps='docker-compose ps'
alias dcl="docker-compose exec --user $(id -u):$(id -g) web /bin/bash"
alias dcdebug="docker-compose down && docker-compose run --service-ports web"
alias dclc="dockerlogin"
alias dwp="docker_wpcli"
alias dcpall='docker_stop_all_containers'

docker_wpcli() {
  declare ARGS
  # if CWD is not WordPress project, exit
  if ! [[ -d ./wp-includes && -d ./wp-admin && -d ./wp-content ]]; then
    echo 'Not in WordPress project.'
    return 1
  fi

  # If WordPress and DB are not running, exit
  CWD=${PWD##*/}
  CONTAINERS_ACTIVE=$(docker ps | grep $CWD | wc -l)
  if [ $CONTAINERS_ACTIVE -lt 2 ]; then
    echo 'Start WordPress and Database containers first.'
    return 1
  fi

  # if container already exists, recreate it
  COUNT=$(docker ps -a | grep wp_cli | wc -l)
  if [ $COUNT -gt 0 ]; then
    echo Recreating wp_cli container..
    docker rm wp_cli
  fi

  # If no arguments are passed, display wp info
  if [ $# -eq 0 ]; then
    ARGS="--info"
  else
    ARGS=("$@")
  fi
  docker-compose run --name wp_cli --rm wp_cli "${ARGS[@]}"
}

dockerlogin() {
  if [ -n "$1" ]
  then
    docker-compose exec --user $(id -u):$(id -g) $1 /bin/bash
  fi
}

docker_stop_all_containers() {
  if ! [[ $(docker stop $(dpsq) 2> /dev/null) ]]; then
    return
  fi
  echo Stopping active containers
}

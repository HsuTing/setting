#!/bin/bash

. command.sh

check_command readline
check_command tree
check_command bash-completion

## set tern for vim
cp ./tern-project /Library/WebServer/Documents/.tern-project

## Install docker
if ! type "docker" > /dev/null 2>&1; then
  print_command \
  "Install docker: https://docs.docker.com/docker-for-mac/"
fi

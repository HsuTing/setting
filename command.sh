#!/bin/bash

. setting.sh

blue="\033[0;34m"
green="\033[32m"
nocolor="\033[0m"

print_title() {
  printf "${green}# $1\n${nocolor}"
}

print_command () {
  printf "${blue}## $1\n${nocolor}"
}

exec_command () {
  print_command "$1"
  $2
}

check_command () {
  if ! type "$1" > /dev/null 2>&1; then
    case $system in
      ($linux)
        exec_command \
        "install $1" \
        "sudo apt-get install -y $1"
        ;;

      ($mac)
        exec_command \
        "install $1" \
        "brew install $1"
        ;;
    esac
  fi
}

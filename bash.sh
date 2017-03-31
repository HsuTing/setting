#!/bin/bash

. setting.sh
. command.sh

case $system in
  ($linux)
    if [ ! -f ~/.bash ]; then
      echo source ~/.bash >> ~/.bashrc
    fi

    rm -rf ~/.bash
    ln ~/setting/bash/bashrc ~/.bash
    ;;

  ($mac)
    rm -rf ~/.bash_profile
    ln ~/setting/bash/bashrc ~/.bash_profile
    ;;
esac

if [ ! -e ~/Desktop/work ]; then
  exec_command \
  "make work folder" \
  "mkdir ~/Desktop/work"
fi

if [ ! -e ~/Desktop/env ]; then
  exec_command \
  "make env folder" \
  "mkdir ~/Desktop/env"
fi

if [ ! -e ~/Desktop/server ]; then
  print_command \
  "make server folder"

  mkdir ~/Desktop/server
  mkdir ~/Desktop/server/key
fi

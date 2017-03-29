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
  mkdir ~/Desktop/work
fi

if [ ! -e ~/Desktop/env ]; then
  mkdir ~/Desktop/env
fi

if [ ! -e ~/Desktop/server ]; then
  mkdir ~/Desktop/server
  mkdir ~/Desktop/server/key
fi

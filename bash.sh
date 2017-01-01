#!/bin/bash

. setting.sh
. command.sh

case $system in
  ($linux)
    if [ ! -f ~/.bash ]; then
      print_command \
      "add custom '.bashrc'"

      echo source ~/.bash >> ~/.bashrc
      ln bashrc ~/.bash
    fi
    ;;

  ($mac)
    if [ ! -f ~/.bash_profile ]; then
      print_command \
      "add custom '.bashrc'"

      ln bashrc ~/.bash_profile
    fi
    ;;
esac

if [ ! -e ~/Desktop/work ]; then
  mkdir ~/Desktop/work
fi

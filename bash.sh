#!/bin/bash

. setting.sh
. command.sh

case $system in
  ($linux)
    if [ ! -f ~/.bash ]; then
      print_command \
      "add custom '.bashrc'"

      echo source ~/.bash >> ~/.bashrc
    fi

    rm -rf ~/.bash
    ln ~/setting/bash/bashrc ~/.bash
    ;;

  ($mac)
    print_command \
    "add custom '.bashrc'"

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

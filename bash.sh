#!/bin/bash

. setting.sh
. command.sh

case $system in
  ($linux)
    if $CUSTOM_BASHRC > /dev/null 2>&1; then
      print_command \
      "add custom '.bashrc'"

      echo source ~/setting/bashrc >> ~/.bashrc
    fi
    ;;

  ($mac)
    ln bashrc ~/.bash_profile
    ;;
esac

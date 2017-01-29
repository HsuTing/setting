#!/bin/bash

. setting.sh
. command.sh

case $system in
  ($linux)
    exec_command \
    "system update" \
    "sudo apt-get -y update"

    exec_command \
    "system upgrade" \
    "sudo apt-get -y upgrade"

    exec_command \
    "system dist-upgrade" \
    "sudo apt-get -y dist-upgrade"

    exec_command \
    "system autoremove" \
    "sudo apt-get -y autoremove"
    ;;

  ($mac)
    exec_command \
    "brew update" \
    "brew update"
    ;;
esac

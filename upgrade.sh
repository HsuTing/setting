#!/bin/bash

. ~/setting/setting.sh
. ~/setting/command.sh

case $system in
  ($linux)
    exec_command \
    "system update" \
    "install_command apt-get -y update"

    exec_command \
    "system upgrade" \
    "install_command apt-get -y upgrade"

    exec_command \
    "system dist-upgrade" \
    "install_command apt-get -y dist-upgrade"

    exec_command \
    "system autoremove" \
    "install_command apt-get -y autoremove"
    ;;

  ($mac)
    exec_command \
    "brew update" \
    "brew update"
    ;;
esac

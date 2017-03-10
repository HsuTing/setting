#!/bin/bash

. ~/setting/setting.sh

set_env () {
  export $1=$2
  case $system in
    ($linux)
      echo -e "Set \e[32m$1\e[39m to \e[32m$2\e[39m."
      ;;
    ($mac)
      echo -e "Set \x1B[32m$1\x1B[39m to \x1B[32m$2\x1B[39m."
      ;;
  esac
}

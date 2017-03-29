#!/bin/bash

. setting.sh
. command.sh

if ! type "psql" > /dev/null 2>&1; then
  check_command postgresql

  case $system in
    ($mac)
      print_command \
      "start postgres server"
      brew services start postgres
      ;;
  esac
fi

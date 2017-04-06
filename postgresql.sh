#!/bin/bash

. setting.sh
. command.sh

if ! type "psql" > /dev/null 2>&1; then
  check_command postgresql

  print_command \
  "start postgres server"

  case $system in
    ($linux)
      sudo service postgresql start
      ;;

    ($mac)
      brew services start postgres
      ;;
  esac
fi

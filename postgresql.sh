#!/bin/bash

. setting.sh
. command.sh

if ! type "psql" > /dev/null 2>&1; then
  check_command postgresql

  print_command \
  "start postgresql server"

  case $system in
    ($linux)
      install_command service postgresql start
      ;;

    ($mac)
      brew services start postgres
      ;;
  esac

  print_command \
  "set postgresql"

  printf "[postgresql] name of database: "
  read db

  createdb $db
fi

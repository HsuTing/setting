#!/bin/bash

. command.sh

check_command postgresql

case $system in
  ($mac)
    exec_command \
    "start postgres server"
    "brew services start postgres"
    ;;
esac

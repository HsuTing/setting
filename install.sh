#!/bin/bash

. setting.sh
. command.sh

print_title "system"
. upgrade.sh
print_title "git"
. git.sh
print_title "nodejs"
. nodejs.sh
print_title "vim"
. vim.sh
print_title "bash"
. bash.sh
print_title "python"
. python.sh
print_title "postgresql"
. postgresql.sh
print_title "docker"
. docker.sh

print_title "other setting"
case $system in
  ($linux)
    . linux.sh
    ;;

  ($mac)
    . mac.sh
    ;;
esac

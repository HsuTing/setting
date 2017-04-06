#!/bin/bash

. ~/setting/setting.sh
. ~/setting/command.sh

print_title "system"
. ~/setting/upgrade.sh
print_title "git"
. ~/setting/git.sh
print_title "nodejs and yarn"
. ~/setting/nodejs.sh
print_title "vim"
. ~/setting/vim.sh
print_title "bash"
. ~/setting/bash.sh
print_title "python"
. ~/setting/python.sh
print_title "docker"
. ~/setting/docker.sh
print_title "postgresql"
. ~/setting/postgresql.sh

print_title "other setting"
case $system in
  ($linux)
    . ~/setting/linux.sh
    ;;

  ($mac)
    . ~/setting/mac.sh
    ;;
esac

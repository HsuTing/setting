#!/bin/bash

. ~/setting/command.sh

if ! git config user.name > /dev/null 2>&1; then
  printf "[git] username: "
  read username

  git config --global user.name "$username"
fi

if ! git config user.email > /dev/null 2>&1; then
  printf "[git] email: "
  read email

  git config --global user.email $email
fi

git config --global alias.gr "log --date=short --graph --pretty=format:'%C(yellow)%h%Creset %ad %C(bold green)%an%Creset %s%C(yellow)%d%Creset'"
git config --global core.editor "vim"

check_command_exist git


#### add ghi
case $system in
  ($linux)
    curl -sL https://raw.githubusercontent.com/stephencelis/ghi/master/ghi > ghi && \
    chmod 755 ghi && \
    mv ghi /usr/local/bin
    ;;

  ($mac)
    check_command ghi
    ;;
esac

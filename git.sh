#!/bin/bash

. command.sh

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

if ! type "git gr" > /dev/null 2>&1; then
  git config --global alias.gr "log --date=short --graph --pretty=format:'%C(yellow)%h%Creset %ad %C(bold green)%an%Creset %s%C(yellow)%d%Creset'"
  git config --global core.editor "vim"
fi
